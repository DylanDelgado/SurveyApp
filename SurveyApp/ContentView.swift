import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Survey App")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: GHQ12SurveyView()) {
                    Text("GHQ-12 Survey")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: AppUsageSurveyView()) {
                    Text("App Usage Survey")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                NavigationLink(destination: ScheduleRemindersView()) {
                    Text("Schedule Daily Reminders")
                        .font(.title2)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Survey Home")
        }
    }
}

#Preview {
    ContentView()
}
