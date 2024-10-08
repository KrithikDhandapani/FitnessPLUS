import SwiftUI

struct STWorkoutThree: View {
    let workoutDaysOrder = [
        "Monday - Squat",
        "Tuesday - Bench Press",
        "Wednesday - Deadlift",
        "Thursday - Standing Barbell Press",
        "Friday - Bent-Over Barbell Row"
    ]
    
    let workoutDays = [
        "Monday - Squat": [
            "Squat",
            "Front Squat",
            "Bulgarian Split Squat",
            "Leg Extension"
        ],
        "Tuesday - Bench Press": [
            "Bench Press",
            "Incline Bench Press",
            "Dumbbell Fly",
            "Tricep Dips"
           
        ],
        "Wednesday - Deadlift": [
            "Deadlift",
            "Good Mornings",
            "Lying Leg Curl",
            "Walking Lunge"
        ],
        "Thursday - Standing Barbell Press": [
            "Standing Barbell Press",
            "Front Raise",
            "Seated Lateral Raise",
            "Rope Tricep Extension"
        ],
        "Friday - Bent-Over Barbell Row": [
            "Bent-Over Barbell Row",
            "Lat Pull Down",
            "Rear Lateral Raise",
            "Incline Dumbbell Curl"
        ]
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("Build total body strength with this 5-day strength-building program! You’re going to train five days a week and should be in and out of the gym in less than an hour.")
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

                                        Text("3 x 5-8") // Updated sets x reps
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
                    Text("Barbell\nCables\nDumbbells\nMachines")
                }
            }
            .padding()
            .navigationBarTitle("Workout Details", displayMode: .inline)
        }
    }
}

struct STWorkoutThree_Previews: PreviewProvider {
    static var previews: some View {
        STWorkoutThree()
    }
}
