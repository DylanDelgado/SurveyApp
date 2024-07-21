import SwiftUI

struct AccountView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var birthday: Date = Date()

    var body: some View {
        VStack {
            Text("Account Information")
                .font(.largeTitle)
                .padding()

            TextField("Enter your name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            DatePicker("Select your birthday", selection: $birthday, displayedComponents: .date)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Account")
    }
}

#Preview {
    AccountView()
}
