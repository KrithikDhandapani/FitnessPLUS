import SwiftUI

struct HomeScreenView: View {
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    HStack(spacing: 20) {
                        // Show the DietLogView button
                        NavigationLink(destination: DietLogView()) {
                            Text("Log Food")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.orange) // Change the button color to orange
                                .cornerRadius(8)
                                .frame(width: 120, height: 120)
                        }

                        // Show the WorkoutView button
                        NavigationLink(destination: WorkoutView()) {
                            Text("Workout Plan")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.orange) // Change the button color to orange
                                .cornerRadius(8)
                                .frame(width: 120, height: 120)
                        }

                        // Add the ActivityTrackerView button
                        NavigationLink(destination: ActivityTrackerView()) {
                            Text("Activity Tracker")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.orange) // Change the button color to orange
                                .cornerRadius(8)
                                .frame(width: 120, height: 120)
                        }
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
