import SwiftUI

struct ThankYouView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentation mode

    var body: some View {
        NavigationView {
            VStack {
                Text("Thank You!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Text("Your responses have been submitted.")
                    .font(.title2)
                    .padding()

                Spacer()

//                Button("Return to Home") {
//                    presentationMode.wrappedValue.dismiss() // Dismiss the view
//                }
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//
//                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ThankYouView()
}
