import SwiftUI
import UserNotifications

struct ScheduleRemindersView: View {
    @State private var times = [Date()]
    @State private var isPermissionDenied: Bool? = nil // Use optional to represent uninitialized state
    @State private var hasRequestedPermission = false // Track if permission request initiated
    
    var body: some View {
        VStack {
            Button("Request Permission") {
                requestNotificationPermission()
                hasRequestedPermission = true // Set to true once button is pressed
            }
            
            if hasRequestedPermission {
                if let isPermissionDenied = isPermissionDenied {
                    if isPermissionDenied {
                        Text("Please enable notifications in settings.")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        Text("Permission already granted")
                            .foregroundColor(.green)
                            .padding()
                    }
                } else {
                    Text("Requesting permission...")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            
            List {
                ForEach(times.indices, id: \.self) { index in
                    DatePicker("Reminder \(index + 1)", selection: $times[index], displayedComponents: .hourAndMinute)
                }
                .onDelete(perform: removeReminder)
                
                Button("Add Reminder") {
                    times.append(Date())
                }
            }
            
            Button("Schedule Notifications") {
                scheduleNotifications()
            }
        }
        .padding()
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                switch settings.authorizationStatus {
                case .notDetermined:
                    // Request authorization
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                        DispatchQueue.main.async {
                            if granted {
                                print("Permission granted")
                                isPermissionDenied = false
                            } else {
                                print("Permission denied")
                                isPermissionDenied = true
                            }
                        }
                    }
                case .denied:
                    // Already denied
                    print("Permission previously denied")
                    isPermissionDenied = true
                case .authorized, .provisional, .ephemeral:
                    // Permission granted
                    print("Permission already granted")
                    isPermissionDenied = false
                @unknown default:
                    break
                }
            }
        }
    }
    
    private func scheduleNotifications() {
        for (index, time) in times.enumerated() {
            let content = UNMutableNotificationContent()
            content.title = "Do the survey!!"
            content.subtitle = "Please I beg you"
            content.sound = UNNotificationSound.default
            
            let calendar = Calendar.current
            let triggerDate = calendar.dateComponents([.hour, .minute], from: time)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Notification scheduling error: \(error.localizedDescription)")
                } else {
                    print("Scheduled reminder \(index + 1) at \(time)")
                }
            }
        }
    }
    
    private func removeReminder(at offsets: IndexSet) {
        times.remove(atOffsets: offsets)
    }
}

#Preview {
    ScheduleRemindersView()
}
