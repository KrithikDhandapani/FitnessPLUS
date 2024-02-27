import SwiftUI

struct STTWorkoutTwo: View {
    let workoutDaysOrder = [
        "Workout A",
        "Workout B",
        "Workout C"
    ]
    
    let workoutDays = [
        "Workout A": [
            "Squats",
            "Bench Press",
            "Barbell Row",
            "Upright Row",
            "Skullcrushers",
            "Dumbbell Curls",
            "Leg Curls",
            "Ab Wheel Roll Out"
        ],
        "Workout B": [
            "Deadlifts",
            "Romanian Deadlift",
            "Seated Overhead Press",
            "Pull Ups",
            "Dips",
            "Barbell Shrugs", "Calf Raises", "Plank"
        ],
        "Workout C": [
            "Squats",
            "Incline Dumbbell Bench Press",
            "One Arm Dumbbell Row",
            "Seated Arnold Press",
            "Cable Tricep Extensions", "Barbell Curls", "Leg Curls", "Ab Wheel Roll Out"
        ]
]
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("This M&S mass building routine is perfect for lifters who want to give full body workouts a try. All major muscle groups are trained, and the program includes a 20 rep set of squats.")
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

                                        Text("5 x 5-10") // Updated sets x reps
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
                    Text("Barbell\nBodyweight\nDumbbells")
                }
            }
            .padding()
            .navigationBarTitle("Workout Details", displayMode: .inline)
        }
    }
}

struct STTWorkoutTwo_Previews: PreviewProvider {
    static var previews: some View {
        STTWorkoutTwo()
    }
}
