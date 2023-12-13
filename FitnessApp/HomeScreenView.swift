import SwiftUI

struct HomeScreenView: View {
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Move the smiley face logo to the top
                    Image(systemName: "smiley.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                        .padding()

                    Spacer()

                    HStack {
                        // Show the DietLogView button
                        NavigationLink(destination: DietLogView()) {
                            Image(systemName: "book.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.green)
                                .clipShape(Circle())
                        }
                        .padding(.leading, 20)

                        // Show the WorkoutView button
                        NavigationLink(destination: WorkoutView()) {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            // Hide the login button if the user is logged in
            .navigationBarItems(leading: isLoggedIn ? nil : AnyView(loginButton))
        }
    }

    // Computed property for the login button
    private var loginButton: some View {
        NavigationLink(
            destination: ContentView(),
            label: {
                Text("Log In")
            }
        )
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
