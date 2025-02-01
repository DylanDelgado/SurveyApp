import SwiftUI
import Firebase
import FirebaseAuth

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userisloggedin: Bool = false
    
    var body: some View {
        if userisloggedin {
            ContentView()
        }
        else {
            content
        }
    }
    var content: some View {
        ZStack {
            // Gradient background with your custom colors
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(UIColor(red: 25/255, green: 96/255, blue: 57/255, alpha: 1)), // #458F5F
                    Color(UIColor(red: 93/255, green: 198/255, blue: 130/255, alpha: 1))  // #5DC682
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Mindful Media Survey")
                    .font(.system(size: 36, weight: .bold, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(y: -50)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Button(action: {
                    register() // Call the register function
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color(UIColor(red: 69/255, green: 143/255, blue: 95/255, alpha: 1)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Button(action: {
                    login() // Call the login function
                }) {
                    Text("Already have an account? Login here.")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }

    // Function for user registration
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            } else {
                print("User created successfully: \(result?.user.email ?? "No Email")")
            }
        }
    }

    // Function for user login
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
            } else {
                print("User logged in successfully: \(result?.user.email ?? "No Email")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
