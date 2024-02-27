import SwiftUI

struct STWorkoutOne: View {
    let workoutDaysOrder = [
        "Push Workout A - Chest, Shoulders & Triceps",
        "Pull Workout A - Back, Traps & Biceps",
        "Legs Workout A - Quads, Hamstrings & Calves",
        "Push Workout B - Chest, Shoulders & Triceps",
        "Pull Workout B - Back, Traps & Biceps",
        "Legs Workout B - Quads, Hamstrings & Calves"
    ]
    
    let workoutDays = [
        "Push Workout A - Chest, Shoulders & Triceps": [
            "Flat Barbell Bench Press",
            "Flat Barbell Bench Press (Use 20% less weight than your previous working sets)",
            "Seated Behind the Neck Press",
            "(Weighted) Tricep Dips",
            "Standing Cable Crossovers",
            "Seated Tricep Extensions (Dumbbell, Rope, or EZ Bar)",
            "Seated Dumbbell Lateral Raises"
        ],
        "Pull Workout A - Back, Traps & Biceps": [
            "Barbell Conventional Deadlift",
            "Barbell Conventional Deadlift (Use 20% less weight than your previous working sets)",
            "(Weighted) Chin-ups",
            "Chest Supported Rows",
            "Shrugs (Dumbbell, Barbell, or Trap Bar)",
            "Standing Barbell Curls", "Standing Cable Reverse Fly"
        ],
        "Legs Workout A - Quads, Hamstrings & Calves": [
            "Barbell Back Squat",
            "Barbell Back Squat (Use 20% less weight than your previous working sets)",
            "Leg Press",
            "Reverse Hyperextension",
            "Leg Curl", "Calf Raises"
        ],
        "Push Workout B - Chest, Shoulders & Triceps": [
            "Standing Overhead Press",
            "Standing Overhead Press (Use 20% less weight than your previous working sets)",
            "Incline Bench Press",
            "Close Grip Bench Press",
            "Seated Machine Fly",
            "Standing Tricep Pushdown", "Standing Cable Lateral Raises"
        ],
        "Pull Workout B - Back, Traps & Biceps": [
            "Barbell Snatch Grip Deadlift",
            "Barbell Snatch Grip Deadlift (Use 20% less weight than your previous working sets)",
            "Barbell Rows",
            "(Weighted) Pull-ups",
            "1-arm Rows",
            "Incline Dumbbell Curl",
            "Seated Machine Reverse Fly"
        ],
        "Legs Workout B - Quads, Hamstrings & Calves": [
            "Barbell Front Squat", "Barbell Front Squat (Use 20% less weight than your previous working sets)", "Barbell Romanian Deadlifts", "Barbell Hip Thrusts", "Dumbbell Lunges", "Seated Leg Extensions", "Hanging Leg Raises"
        ],
        
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("This 6 day push/pull/legs workout routine split is a high volume, rest-pause system designed for intermediate lifters looking to gain muscle and strength.")
                }

                Section(header: Text("Workout Schedule")) {
                    ForEach(workoutDaysOrder, id: \.self) { day in
                        if let exercises = workoutDays[day] {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(day)
                                    .font(.subheadline)
                                    .bold()

                                ForEach(exercises, id: \.self) { exercise in
                                    HStack {
                                        Text(exercise)
                                            .foregroundColor(.orange)
                                            .bold()

                                        Spacer()

                                        Text("4 x 6-10") // Updated sets x reps
                                            .foregroundColor(.black) // Changed text color to black
                                            .bold()
                                    }
                                }

                                // Divider for better separation
                                Divider()
                                    .background(Color.white)
                            }
                        }
                    }
                }

                Section(header: Text("Equipment Needed")) {
                    Text("Barbell\nBodyweight\nDumbbells\nMachines")
                }
            }
            .padding()
            .navigationBarTitle("Workout Details", displayMode: .inline)
        }
    }
}

struct STWorkoutOne_Previews: PreviewProvider {
    static var previews: some View {
        STWorkoutOne()
    }
}
