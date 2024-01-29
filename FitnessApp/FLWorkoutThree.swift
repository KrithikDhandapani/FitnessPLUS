import SwiftUI

struct FLWorkoutThree: View {
    let workoutDaysOrder = ["Monday: Upper Body Workout", "Tuesday: Lower Body Workout", "Wednesday: Upper Body Workout", "Thursday: Lower Body Workout", "Friday : Rest", "Saturday: Full Body Workout"]

    
    let workoutDays = [
        "Monday: Upper Body Workout": ["Single Arm Dumbbell Row", "Incline Dumbbell Bench Press", "Lat Pull Down", "Cable Lateral Raise", "Incline Dumbbell Curl", "French Press"],
        "Tuesday: Lower Body Workout": ["Back Squat", "Dumbbell Lunge", "Hip Thrust", "Leg Curl", "Calf Raises"],
        "Wednesday: Upper Body Workout": ["Pull Up", "Decline Hammer Machine Press", "Cable Row", "Dumbbell Shoulder Press", "Preacher Curl", "Skull Crusher"],
        "Thursday: Lower Body Workout": ["Hack Squat", "Leg Extension", "Dumbbell RDLs", "Seated Leg Curls", "Calf Raises"],
        "Friday : Rest" : [],
        "Saturday: Full Body Workout": ["Trap Bar Deadlift", "Dips", "Lat Pull Down", "Machine Row", "Cable Curl"]
        // Add other days...
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("Jumpstart your fat loss journey with a fat loss workout perfect for helping you maintain muscle and burn calories. This 8 week program is sure to help!")
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

                                        Text("4 12, 10, 8, 6")
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
                    Text("Barbell\nBodyweight\n Cables\nDumbbells\nEZ Bar\nMachines\nOther")
                }
            }
            .padding()
            .navigationBarTitle("Workout Details", displayMode: .inline)
        }
    }
}


struct FLWorkoutThree_Previews: PreviewProvider {
    static var previews: some View {
        FLWorkoutThree()
    }
}
