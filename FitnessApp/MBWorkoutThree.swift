import SwiftUI
import URLImage

struct MBWorkoutThree: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Top Image
                URLImage(URL(string: "https://cdn.muscleandstrength.com/sites/default/files/4_day_maximum_mass_-_1200x630.jpg")!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(15)
                }

                // Workout Title
                Text("4 Day Maximum Mass Workout")
                    .font(.title)
                    .bold()
                    .padding(.top, 10)

                // Workout Overview
                Text("Overview")
                    .font(.headline)
                    .padding(.top, 5)

                Text("This 4-day maximum mass workout is designed to help you gain muscle mass and strength. The program incorporates compound exercises and progressive overload to stimulate muscle growth.")

                // Workout Details
                Text("Workout Details")
                    .font(.headline)
                    .padding(.top, 10)

                // Add your workout details here...

                // Equipment Needed
                Text("Equipment Needed")
                    .font(.headline)
                    .padding(.top, 10)

                Text("For this workout, you will need standard gym equipment, including barbells, dumbbells, and a power rack. Make sure to use challenging weights while maintaining proper form.")

                // Additional Tips
                Text("Additional Tips")
                    .font(.headline)
                    .padding(.top, 10)

                // Add additional tips and information...

                // Add any other sections you need...

            }
            .padding()
        }
        .navigationBarTitle("4 Day Maximum Mass Workout", displayMode: .inline)
    }
}

struct MBWorkoutThree_Previews: PreviewProvider {
    static var previews: some View {
        MBWorkoutThree()
    }
}
