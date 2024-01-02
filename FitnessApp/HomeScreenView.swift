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

                    HStack {
                        // Move the BarChartView to the center
                        BarChartView(data: ChartData(points: [
                            DataPoint(label: "Calories", value: 10),
                            DataPoint(label: "Protein", value: 20),
                            DataPoint(label: "Steps", value: 50),
                            DataPoint(label: "Sleep", value: 7)
                        ]), title: "")
                        .frame(width: 200, height: 100) // Adjust the width and height based on your preference
                        .padding(.bottom, 20)
                    }

                    HStack(spacing: 20) {
                        // Show the DietLogView button
                        NavigationLink(destination: DietLogView()) {
                            Text("Log Food")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.orange)
                                .cornerRadius(8)
                                .frame(width: 120, height: 120)
                        }

                        // Show the WorkoutChooserView button
                        NavigationLink(destination: WorkoutChooserView()) {
                            Text("Workout Plan")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.orange)
                                .cornerRadius(8)
                                .frame(width: 120, height: 120)
                        }

                        // Add the ActivityTrackerView button
                        NavigationLink(destination: ActivityTrackerView()) {
                            Text("Activity Tracker")
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color.orange)
                                .cornerRadius(8)
                                .frame(width: 120, height: 120)
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            // Hide the login button if the user is logged in
            .navigationBarItems(
                leading: isLoggedIn ? nil : AnyView(loginButton),
                trailing: Image(systemName: "gear")
                    .foregroundColor(.orange)
                    .font(.system(size: 24)) // Adjust the font size here
                    .onTapGesture {
                        // Handle settings button tap
                        // You can navigate to a settings view or show a settings sheet here
                    }
            )
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
