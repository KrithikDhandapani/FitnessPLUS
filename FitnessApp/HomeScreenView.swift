import SwiftUI

struct HomeScreenView: View {
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        // Use GeometryReader to get the screen width
                        GeometryReader { geometry in
                            // Move the BarChartView to the center horizontally and add some padding to the leading edge
                            VStack {
                                Spacer()

                                HStack(spacing: 20) { // Adjust spacing between bars
                                    // Category: Calories
                                    BarChartView(label: "Calories", value: 90, maxHeight: 200)

                                    // Category: Protein
                                    BarChartView(label: "Protein", value: 50, maxHeight: 200)

                                    // Category: Steps
                                    BarChartView(label: "Steps", value: 30, maxHeight: 200)

                                    // Category: Sleep
                                    BarChartView(label: "Sleep", value: 2, maxHeight: 200)
                                }
                                .frame(width: min(geometry.size.width, 300), height: 200) // Set a fixed height
                                .padding(.horizontal, 20)
                            }
                        }
                        .padding(.leading, 20) // Adjust the padding to move it to the right
                    }
                    .padding(.top, 20) // Adjusted padding to move BarChartView above buttons

                    Spacer() // Spacer to push the following HStack to the bottom

                    HStack(spacing: 20) { // Increase the spacing between buttons
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
                    .padding(.bottom, 40) // Adjust the padding to increase or decrease the space between BarChartView and buttons
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
    struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreenView()
        }
    }
    
    struct BarChartView: View {
        var label: String
        var value: Double
        var maxHeight: CGFloat

        var body: some View {
            VStack(spacing: 5) {
                let positiveChange = max(0, value)

                // Calculate the remaining space from the bottom of the bar to the maximum height
                let remainingSpace = max(0, maxHeight - CGFloat(positiveChange * 2))

                // Adjust the height of the bar and add spacing
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 40, height: CGFloat(positiveChange * 2))
                    .padding(.top, remainingSpace)

                Text(label)
                    .frame(height: 20)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
        }
    }



}
