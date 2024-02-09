import SwiftUI
import URLImage // Assuming this import is necessary for your broader project

struct MBWorkoutOne: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("Main Goal: Build Muscle \nTraining Level: Beginner \nDays Per Week: 4 Days \nProgram Duration: 8 Weeks \nAuthor: Roger “Rock” Lockridge")
                }

                Section(header: Text("Workout Schedule")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Workout 1 - Chest/Shoulders")
                            .font(.subheadline)
                            .bold()

                        ForEach(["Incline Bench Press", "Dumbbell Bench Press", "Cable Crossover", "Tricep Dip", "Seated Dumbbell Press", "Lateral Raise", "Machine Reverse Fly"], id: \.self) { exercise in
                            HStack {
                                Text(exercise)
                                    .foregroundColor(.orange)
                                    .bold()

                                Spacer()

                                Text("4 x 6-10") // Standardized sets x reps
                            }
                        }

                        Divider().background(Color.white)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Workout 2 - Back")
                            .font(.subheadline)
                            .bold()

                        ForEach(["Deadlift", "One Arm Dumbbell Row", "Lat Pull Down", "Seated Row", "Single Arm Lat Pull Down", "Hyperextension", "Dumbbell Shrug"], id: \.self) { exercise in
                            HStack {
                                Text(exercise)
                                    .foregroundColor(.orange)
                                    .bold()

                                Spacer()

                                Text("4 x 6-10") // Standardized sets x reps
                            }
                        }

                        Divider().background(Color.white)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Workout 3 - Legs")
                            .font(.subheadline)
                            .bold()

                        ForEach(["Barbell Squat", "Hack Squat", "Leg Press", "Dumbbell Lunge", "Lying Leg Curl", "Seated Calf Raise", "Standing Calf Raise"], id: \.self) { exercise in
                            HStack {
                                Text(exercise)
                                    .foregroundColor(.orange)
                                    .bold()

                                Spacer()

                                Text("4 x 6-10") // Standardized sets x reps
                            }
                        }

                        Divider().background(Color.white)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Workout 4 - Arms")
                            .font(.subheadline)
                            .bold()

                        ForEach(["Close Grip Bench Press", "One-Arm Seated Overhead Tricep Extension", "Straight Bar Tricep Extension", "Barbell Preacher Curl", "Incline Dumbbell Curl", "Cable Curl", "Seated Barbell Wrist Curl"], id: \.self) { exercise in
                            HStack {
                                Text(exercise)
                                    .foregroundColor(.orange)
                                    .bold()

                                Spacer()

                                Text("4 x 6-10") // Standardized sets x reps
                            }
                        }

                        Divider().background(Color.white)
                    }
                }

                Section(header: Text("Equipment Needed")) {
                    Text("Barbell\nCables\nDumbbells\nMachines")
                }
            }
            .padding()
            .navigationBarTitle("Workout Details", displayMode: .inline)
        }
    }
}

struct MBWorkoutOne_Previews: PreviewProvider {
    static var previews: some View {
        MBWorkoutOne()
    }
}
