import SwiftUI
import URLImage

struct MBWorkoutOne: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                URLImage(URL(string: "https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/muscular_man_doing_tricep_push_down.jpg?itok=AGUMbsj8")!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(15)
                }

                Text("8-Week Mass Building Workout for Beginners")
                    .font(.title)
                    .bold()

                // Workout Overview
                Text("Overview")
                    .font(.headline)
                    .padding(.top, 5)

                Text("Main Goal: Build Muscle \nTraining Level: Beginner \nDays Per Week: 4 Days \nProgram Duration: 8 Weeks \nAuthor: Roger “Rock” Lockridge")

                // Workout Schedule
                Text("Workout Schedule")
                    .font(.headline)
                    .padding(.top, 10)
                
                // Exercise Sets Reps Table
                VStack(alignment: .leading, spacing: 10) {
                    Text("Exercise Sets Reps")
                        .font(.subheadline)
                        .bold()

                    ForEach(["Incline Bench Press", "Dumbbell Bench Press", "Cable Crossover", "Tricep Dip", "Seated Dumbbell Press", "Lateral Raise", "Machine Reverse Fly"], id: \.self) { exercise in
                        HStack {
                            Text(exercise)
                                .foregroundColor(.orange)
                                .bold()

                            Spacer()

                            Text("4 12, 10, 8, 6")
                        }
                    }

                    // Divider for better separation
                    Divider()
                        .background(Color.white)
                }

                
                // Additional Exercise Sets Reps Table
                VStack(alignment: .leading, spacing: 10) {
                    Text("Additional Exercise Sets Reps")
                        .font(.subheadline)
                        .bold()

                    ForEach(["Deadlift", "One Arm Dumbbell Row", "Lat Pull Down", "Seated Row", "Single Arm Lat Pull Down", "Hyperextension", "Dumbbell Shrug"], id: \.self) { exercise in
                        HStack {
                            Text(exercise)
                                .foregroundColor(.orange)
                                .bold()

                            Spacer()

                            Text("4 12, 10, 8, 6")
                        }
                    }

                    // Divider for better separation
                    Divider()
                        .background(Color.white)
                }

                
                // Third Exercise Sets Reps Table
                VStack(alignment: .leading, spacing: 10) {
                    Text("Third Exercise Sets Reps")
                        .font(.subheadline)
                        .bold()

                    ForEach(["Barbell Squat", "Hack Squat", "Leg Press", "Dumbbell Lunge", "Lying Leg Curl", "Seated Calf Raise", "Standing Calf Raise"], id: \.self) { exercise in
                        HStack {
                            Text(exercise)
                                .foregroundColor(.orange)
                                .bold()

                            Spacer()

                            Text("4 12, 10, 8")
                        }
                    }

                    // Divider for better separation
                    Divider()
                        .background(Color.white)
                }

                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Fourth Exercise Sets Reps")
                        .font(.subheadline)
                        .bold()

                    ForEach(["Close Grip Bench Press", "One-Arm Seated Overhead Tricep Extension", "Straight Bar Tricep Extension", "Barbell Preacher Curl", "Incline Dumbbell Curl", "Cable Curl", "Seated Barbell Wrist Curl"], id: \.self) { exercise in
                        HStack {
                            Text(exercise)
                                .foregroundColor(.orange)
                                .bold()

                            Spacer()

                            Text("4 12, 10, 8, 6")
                        }
                    }

                    // Divider for better separation
                    Divider()
                        .background(Color.white)
                }

                
                

                // Add your workout schedule details here...

                // Equipment Needed
                Text("Equipment Needed")
                    .font(.headline)
                    .padding(.top, 10)
                
           //     Text("Barbell\nCables\nDumbbells\nMachines")

                // Add information about the equipment needed...

                // Additional Tips

                // Add any other sections you need...

            }
            .padding()
        }
        .navigationBarTitle("Workout Details", displayMode: .inline)
    }
}

struct MBWorkoutOne_Previews: PreviewProvider {
    static var previews: some View {
        MBWorkoutOne()
    }
}
