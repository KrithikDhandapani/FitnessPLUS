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
                Spacer()

                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.accentColor)

                TextField("Username", text: $userData.username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)

                SecureField("Password", text: $userData.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
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
                    // Add login logic here
                    if UserDefaults.standard.string(forKey: userData.username) == userData.password {
                        isLoggedIn = true
                        loginError = nil
                    } else {
                        loginError = "Incorrect username or password"
                    }
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }

                Button(action: {
                    // Set the flag to activate the navigation
                    isCreateAccountActive = true
                }) {
                    Text("Create Account")
                        .foregroundColor(.accentColor)
                        .padding(.top, 20)
                }
                .sheet(isPresented: $isCreateAccountActive, onDismiss: {
                    // Reset data after creating an account
                    userData.username = ""
                    userData.password = ""
                }) {
                    CreateAccountView(userData: userData, isCreateAccountActive: $isCreateAccountActive)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Login", displayMode: .inline)
        }
    }
}

// Rest of the code remains unchanged...


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
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal, 20)
                .autocapitalization(.none)

            SecureField("New Password", text: $userData.password)
                .padding()
                .background(Color.gray.opacity(0.2))
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
                // Add create account logic here
                // For now, let's print the new username, password, and birthdate
                print("New Username: \(userData.username)")
                print("New Password: \(userData.password)")
                print("Birthdate: \(birthDate)")

                // Save user data to UserDefaults
                UserDefaults.standard.set(userData.password, forKey: userData.username)

                // Dismiss the sheet and go back to the login view
                isCreateAccountActive = false
            }) {
                Text("Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Create Account", displayMode: .inline)
    }
}
