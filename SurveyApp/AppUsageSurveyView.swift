import SwiftUI

struct AppUsageSurveyView: View {
    @State private var selectedAppIndex = 0
    @State private var selectedMotiveIndex = 0
    @State private var selectedActivityIndex = 0
    @EnvironmentObject var dataManager: DataManager
    @State private var showAlert = false
    
    let socialMediaApps = ["Instagram", "Facebook", "Twitter", "Snapchat", "TikTok", "WhatsApp", "LinkedIn", "Reddit", "Pinterest", "YouTube", "Other"]
    let motives = ["Entertainment", "Communicating", "Seeing what others are up to", "Distraction"]
    let activity = ["Messaging", "Posting", "Browsing"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Main Social Media App")) {
                    Picker(selection: $selectedAppIndex, label: Text("Main Social Media App")) {
                        ForEach(0..<socialMediaApps.count, id: \.self) { index in
                            Text(socialMediaApps[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Select Activity")) {
                    Picker(selection: $selectedActivityIndex, label: Text("Activity")) {
                        ForEach(0..<activity.count, id: \.self) { index in
                            Text(activity[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Select Reason")) {
                    Picker(selection: $selectedMotiveIndex, label: Text("Reason")) {
                        ForEach(0..<motives.count, id: \.self) { index in
                            Text(motives[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Button(action: submitSurvey) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("App Usage Survey")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Survey Submitted"),
                    message: Text("Thank you for completing the survey!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    func submitSurvey() {
        dataManager.addAppUsage(App: (socialMediaApps[selectedAppIndex]), Motive: (activity[selectedActivityIndex]), Activity: (motives[selectedMotiveIndex]))
        
        showAlert = true
    }
}

struct AppUsageSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        AppUsageSurveyView()
    }
}
