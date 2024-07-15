import SwiftUI

struct GHQ12SurveyView: View {
    @State private var responses = Array(repeating: 0, count: 12)

    let questions = [
        "Have you recently been able to concentrate on whatever you’re doing?",
        "Have you recently lost much sleep over worry?",
        "Have you recently felt that you are playing a useful part in things?",
        "Have you recently felt capable of making decisions about things?",
        "Have you recently felt constantly under strain?",
        "Have you recently felt you couldn’t overcome your difficulties?",
        "Have you recently been able to enjoy your normal day-to-day activities?",
        "Have you recently been able to face up to your problems?",
        "Have you recently been feeling unhappy and depressed?",
        "Have you recently been losing confidence in yourself?",
        "Have you recently been thinking of yourself as a worthless person?",
        "Have you recently been feeling reasonably happy, all things considered?"
    ]

    let options = ["Better than usual", "Same as usual", "Less than usual", "Much less than usual"]

    var body: some View {
        NavigationView{
            Form {
                ForEach(0..<questions.count, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(questions[index])
                            .font(.headline)
                        Picker("Select an option", selection: $responses[index]) {
                            ForEach(0..<options.count, id: \.self) { optionIndex in
                                Text(options[optionIndex]).tag(optionIndex)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding(.vertical, 8)
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
        .navigationTitle("Mental Health Survey")

        }
    }
}


struct GHQ12SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        GHQ12SurveyView()
    }
}

