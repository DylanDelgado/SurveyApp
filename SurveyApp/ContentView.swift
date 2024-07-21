import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Mindful Media App")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: GHQ12SurveyView()) {
                    Text("Mental Health Survey")
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
                
                NavigationLink(destination: InstructionsView()) {
                    Text("How to Use the App")
                        .font(.title2)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Survey Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AccountView()) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
