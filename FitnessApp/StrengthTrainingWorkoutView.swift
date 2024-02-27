import SwiftUI
import URLImage

struct StrengthTrainingWorkoutView: View {
    @State private var showSTWorkoutOneDetails = false
    @State private var showSTTWorkoutTwoDetails = false
    @State private var showSTWorkoutThreeDetails = false  // Add another state for the new workout

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Workout 1
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/6_day_ppl_-_1200x630.jpg?itok=hKlHF0Oj",
                            title: "6 Day Push/Pull/Leg Powerbuilding Routine",  // Replace with actual title
                            onTapGesture: {
                                showSTWorkoutOneDetails.toggle()
                            })
                    .background(NavigationLink("", destination: STWorkoutOne(), isActive: $showSTWorkoutOneDetails))

                // Workout 2
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/ms_full_body_routine_-_1200x630.jpg?itok=sLsyAWwY",
                            title: "Muscle and Strength full body workout routine",  // Replace with actual title
                            onTapGesture: {
                                showSTTWorkoutTwoDetails.toggle()
                            })
                    .background(NavigationLink("", destination: STTWorkoutTwo(), isActive: $showSTTWorkoutTwoDetails))

                // Workout 3
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/muscular_athlete_doing_dumbbell_shoulder_press.jpg?itok=bblYwy4r",
                            title: "8 Week Strength Training for Beginners",  // Replace with actual title
                            onTapGesture: {
                                showSTWorkoutThreeDetails.toggle()
                            })
                    .background(NavigationLink("", destination: STWorkoutThree(), isActive: $showSTWorkoutThreeDetails))
                
            }
            .padding()
        }
        .navigationBarTitle("Strength Training Workouts", displayMode: .inline)
    }
}

struct StrengthTrainingWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        StrengthTrainingWorkoutView()
    }
}

// WorkoutCard struct remains the same
