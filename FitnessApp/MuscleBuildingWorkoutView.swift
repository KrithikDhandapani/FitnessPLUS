import SwiftUI
import URLImage

struct MuscleBuildingWorkoutView: View {
    @State private var showMBWorkoutOneDetails = false
    @State private var showMBWorkoutTwoDetails = false
    @State private var showMBWorkoutThreeDetails = false  // Add another state for the new workout

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Workout 1
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/muscular_man_doing_tricep_push_down.jpg?itok=AGUMbsj8",
                            title: "8 Week Muscle Building Workout for Beginners",
                            onTapGesture: {
                                showMBWorkoutOneDetails.toggle()
                            })
                    .background(NavigationLink("", destination: MBWorkoutOne(), isActive: $showMBWorkoutOneDetails))

                // Workout 2
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/5_day_dumbbell_workout_-_1200x630.jpg?itok=wvEt4RRY",
                            title: "5 Day Dumbbell Workout Split",
                            onTapGesture: {
                                showMBWorkoutTwoDetails.toggle()
                            })
                    .background(NavigationLink("", destination: MBWorkoutTwo(), isActive: $showMBWorkoutTwoDetails))

                // Workout 3
                WorkoutCard(imageURL: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/4_day_maximum_mass_-_1200x630.jpg?itok=zlbj7FCp",
                            title: "4 Day Maximum Mass Workout",
                            onTapGesture: {
                                showMBWorkoutThreeDetails.toggle()
                            })
                    .background(NavigationLink("", destination: MBWorkoutThree(), isActive: $showMBWorkoutThreeDetails))
                
                
            }
            .padding()
        }
        .navigationBarTitle("Muscle Building Workouts", displayMode: .inline)
    }
}

struct MuscleBuildingWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        MuscleBuildingWorkoutView()
    }
}

struct WorkoutCard: View {
    var imageURL: String
    var title: String
    var onTapGesture: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header Image
            URLImage(URL(string: imageURL)!) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(15)
            }

            Text(title)
                .font(.title2)
                .bold()
                .padding(.top, 10)

            // Add your workout details and content here...

            // Use onTapGesture to navigate to WorkoutDetailsView
            Text("Workout Details")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(8)
                .onTapGesture {
                    onTapGesture()
                }
        }
    }
}
