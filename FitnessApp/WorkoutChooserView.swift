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
                        selectedWorkout = "Calisthenics"
                    }) {
                        Text("Calisthenics")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        selectedWorkout = "Weight Lifting"
                    }) {
                        Text("Weight Lifting")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        selectedWorkout = "Cardio"
                    }) {
                        Text("Cardio")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }

                    NavigationLink(
                        destination: destinationView,
                        tag: "Calisthenics",
                        selection: $selectedWorkout
                    ) {
                        EmptyView()
                    }
                    .isDetailLink(false)

                    NavigationLink(
                        destination: destinationView,
                        tag: "Weight Lifting",
                        selection: $selectedWorkout
                    ) {
                        EmptyView()
                    }
                    .isDetailLink(false)

                    NavigationLink(
                        destination: destinationView,
                        tag: "Cardio",
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
        case "Calisthenics":
            return AnyView(CalisthenicsWorkoutView())
        case "Weight Lifting":
            return AnyView(WeightLiftingWorkoutView())
        case "Cardio":
            return AnyView(CardioWorkoutView())
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
