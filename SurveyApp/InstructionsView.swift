import SwiftUI

struct InstructionsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to Mindful Media!")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Text("Thank you for participating in this study!")
                
                Image("profile_creation")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                Text("Once you have created your profile, complete the Wellness Assessment Survey.")
                
                Image("set_reminders")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                Text("Next, set reminders for three separate times during the day (ex: 8:00am, 12:00pm, 6:00pm) to complete a survey about your social media use up to that point in the day.")
                
                Image("social_media_survey") // Example image name
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                Text("For seven days, fill out the Social Media Use Survey when you receive a notification. Don’t worry if you miss one throughout the day, please continue participating and try to complete three surveys each day.")
                
                Text("After one week, fill out the Wellness Assessment Survey again.")
                
                Text("Once you have completed the study, you may enter your name and email to enter a raffle to receive a $25 gift card! You may now delete the app. If you do not delete the app, no further data will be collected.")
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Instructions")
    }
}

#Preview {
    InstructionsView()
}
