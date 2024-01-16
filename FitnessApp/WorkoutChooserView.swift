import SwiftUI

struct WorkoutChooserView: View {
    @State private var selectedWorkout: String?

    var body: some View {
        NavigationView {
            ZStack { // Add ZStack
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Button(action: {
                        selectedWorkout = "Muscle Building"
                    }) {
                        Text("Muscle Building")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        selectedWorkout = "Fat Loss"
                    }) {
                        Text("Fat Loss")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        selectedWorkout = "Strength Training"
                    }) {
                        Text("Strength Training")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }

                    NavigationLink(
                        destination: destinationView,
                        tag: "Muscle Building",
                        selection: $selectedWorkout
                    ) {
                        EmptyView()
                    }
                    .isDetailLink(false)

                    NavigationLink(
                        destination: destinationView,
                        tag: "Fat Loss",
                        selection: $selectedWorkout
                    ) {
                        EmptyView()
                    }
                    .isDetailLink(false)

                    NavigationLink(
                        destination: destinationView,
                        tag: "Strength Training",
                        selection: $selectedWorkout
                    ) {
                        EmptyView()
                    }
                    .isDetailLink(false)
                }
                .padding()
                .navigationBarTitle("Choose Workout", displayMode: .inline)
            }
        }
    }

    // Function to determine the destination view based on the selected workout

    private var destinationView: some View {
        switch selectedWorkout {
        case "Muscle Building":
            return AnyView(MuscleBuildingWorkoutView())
        case "Fat Loss":
            return AnyView(FatLossWorkoutView())
        case "Strength Training":
            return AnyView(StrengthTrainingWorkoutView())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct WorkoutChooserView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChooserView()
    }
}
