import SwiftUI
import URLImage

struct MBWorkoutTwo: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Top Image
                URLImage(URL(string: "https://cdn.muscleandstrength.com/sites/default/files/5_day_dumbbell_workout_-_1200x630.jpg")!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(15)
                }

                // Workout Title
                Text("5 Day Dumbbell Workout Split")
                    .font(.title)
                    .bold()
                    .padding(.top, 10)

                // Workout Overview
                Text("Overview")
                    .font(.headline)
                    .padding(.top, 5)

                Text("This 5-day dumbbell workout split is designed to help you build muscle and strength using only dumbbells. Each day focuses on different muscle groups to ensure a balanced and effective workout routine.")

                // Workout Details
                Text("Workout Details")
                    .font(.headline)
                    .padding(.top, 10)

                // Add your workout details here...

                // Equipment Needed
                Text("Equipment Needed")
                    .font(.headline)
                    .padding(.top, 10)

                Text("All you need for this workout is a set of dumbbells. Choose a weight that challenges you while allowing you to maintain proper form throughout each exercise.")

                // Additional Tips
                Text("Additional Tips")
                    .font(.headline)
                    .padding(.top, 10)

                // Add additional tips and information...

                // Add any other sections you need...

            }
            .padding()
        }
        .navigationBarTitle("5 Day Dumbbell Workout Split", displayMode: .inline)
    }
}

struct MBWorkoutTwo_Previews: PreviewProvider {
    static var previews: some View {
        MBWorkoutTwo()
    }
}
