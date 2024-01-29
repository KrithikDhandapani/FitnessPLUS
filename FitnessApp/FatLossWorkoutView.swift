import SwiftUI
import URLImage

struct FatLossWorkoutView: View {
    @State private var showFLWorkoutOneDetails = false
    @State private var showFLWorkoutTwoDetails = false
    @State private var showFLWorkoutThreeDetails = false  // Add another state for the new workout

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Workout 1
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/spring_shred_-_1200x630.jpg?itok=o978y346",
                            title: "8 Week Fat Loss Workout Plan",  // Replace with actual title
                            onTapGesture: {
                                showFLWorkoutOneDetails.toggle()
                            })
                    .background(NavigationLink("", destination: FLWorkoutOne(), isActive: $showFLWorkoutOneDetails))

                // Workout 2
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/fat_blaster_-_1200x630.jpg?itok=Awz66KHc",
                            title: "6 Day Weight/Cardio Cutting Workout",  // Replace with actual title
                            onTapGesture: {
                                showFLWorkoutTwoDetails.toggle()
                            })
                    .background(NavigationLink("", destination: FLWorkoutTwo(), isActive: $showFLWorkoutTwoDetails))

                // Workout 3
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/body_fat_beatdown_-_1200x630.jpg?itok=oOHZ9LMM",
                            title: "8 Week Workout To Destroy Body Fat",  // Replace with actual title
                            onTapGesture: {
                                showFLWorkoutThreeDetails.toggle()
                            })
                    .background(NavigationLink("", destination: FLWorkoutThree(), isActive: $showFLWorkoutThreeDetails))
                
            }
            .padding()
        }
        .navigationBarTitle("Fat Loss Workouts", displayMode: .inline)
    }
}

struct FatLossWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        FatLossWorkoutView()
    }
}

// WorkoutCard struct remains the same
