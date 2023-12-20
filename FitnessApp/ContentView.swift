import SwiftUI

class UserData: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}

struct ContentView: View {
    @StateObject private var userData = UserData()
    @State private var isCreateAccountActive = false
    @State private var isLoggedIn = false
    @State private var loginError: String?

    var body: some View {
        NavigationView {
            VStack {
                // Arched Title
                HStack {
                    Spacer()
                    Text("Fitness")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                    Text("PLUS")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                    Spacer()
                }
                .padding(.top, 20)

                Spacer()

                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange) // Change the profile logo color to orange

                TextField("Username", text: $userData.username)
                    .padding()
                    .foregroundColor(.black) // Change text color to black
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1)) // Add orange border
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)

                SecureField("Password", text: $userData.password)
                    .padding()
                    .foregroundColor(.black) // Change text color to black
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1)) // Add orange border
                    .cornerRadius(8)
                    .padding(.horizontal, 20)

                if let loginError = loginError {
                    Text(loginError)
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                }

                NavigationLink(destination: HomeScreenView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .hidden()

                Button(action: {
                    login()
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange) // Change the button background color to orange
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }

                Button(action: {
                    isCreateAccountActive = true
                }) {
                    Text("Create Account")
                        .foregroundColor(.accentColor)
                        .padding(.top, 20)
                }
                .sheet(isPresented: $isCreateAccountActive, onDismiss: {
                    userData.username = ""
                    userData.password = ""
                }) {
                    CreateAccountView(userData: userData, isCreateAccountActive: $isCreateAccountActive)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .background(Color.white)
        }
    }

    private func login() {
        if UserDefaults.standard.string(forKey: userData.username) == userData.password {
            isLoggedIn = true
            loginError = nil
        } else {
            loginError = "Incorrect username or password"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CreateAccountView: View {
    @ObservedObject var userData: UserData
    @Binding var isCreateAccountActive: Bool
    @State private var birthDate = Date()

    var body: some View {
        VStack {
            Spacer()

            TextField("New Username", text: $userData.username)
                .padding()
                .foregroundColor(.black) // Change text color to black
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1)) // Add orange border
                .cornerRadius(8)
                .padding(.horizontal, 20)
                .autocapitalization(.none)

            SecureField("New Password", text: $userData.password)
                .padding()
                .foregroundColor(.black) // Change text color to black
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange, lineWidth: 1)) // Add orange border
                .cornerRadius(8)
                .padding(.horizontal, 20)

            DatePicker(
                "Birthdate",
                selection: $birthDate,
                in: ...Date(),
                displayedComponents: [.date]
            )
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)

            Button(action: {
                createAccount()
            }) {
                Text("Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange) // Change the button background color to orange
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Create Account", displayMode: .inline)
        .background(Color.white)
    }

    private func createAccount() {
        guard !userData.username.isEmpty && !userData.password.isEmpty else {
            print("Username and password cannot be empty.")
            return
        }

        if UserDefaults.standard.string(forKey: userData.username) != nil {
            print("Username already exists. Choose a different one.")
            return
        }

        print("New Username: \(userData.username)")
        print("New Password: \(userData.password)")
        print("Birthdate: \(birthDate)")

        UserDefaults.standard.set(userData.password, forKey: userData.username)

        isCreateAccountActive = false
    }
}
