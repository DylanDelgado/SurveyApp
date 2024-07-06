import SwiftUI

struct AppUsageSurveyView: View {
    @State private var selectedAppIndex = 0
    @State private var selectedMotiveIndex = 0
    let socialMediaApps = ["Instagram", "Facebook", "Twitter", "Snapchat", "TikTok", "WhatsApp", "LinkedIn", "Reddit", "Pinterest", "YouTube", "Other"]
    let motives = ["Entertainment", "Relationship Maintenance", "FOMO", "Escapism"]

    
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

                Section(header: Text("Select Reason Motive")) {
                    Picker(selection: $selectedMotiveIndex, label: Text("Reason Motive")) {
                        ForEach(0..<motives.count, id: \.self) { index in
                            Text(motives[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                NavigationLink(destination: ThankYouView()) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("App Usage Survey")
        }
    }
}

struct AppUsageSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        AppUsageSurveyView()
    }
}
