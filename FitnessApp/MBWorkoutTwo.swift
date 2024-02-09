import SwiftUI

struct MBWorkoutTwo: View {
    let workoutDaysOrder = ["Day 1: Chest & Triceps", "Day 2: Legs & Core", "Day 3: Back & Biceps", "Day 4: Legs & Core", "Day 5: Complete Upper Body"]

    let workoutDays = [
        "Day 1: Chest & Triceps": ["Dumbbell Bench Press", "Incline Dumbbell Bench Press", "Dumbbell Floor Press", "Standing Dumbbell Press", "Dumbbell Lateral Raise", "Dumbbell Tricep Kickback"],
        "Day 2: Legs & Core": ["Dumbbell Goblet Squat", "Dumbbell Stiff Leg Deadlift", "Dumbbell Rear Lunge", "Dumbbell Frog Squat", "Dumbbell Calf Raise", "Weighted Crunch", "Side Planks"],
        "Day 3: Back & Biceps": ["Dumbbell Bent Over Row", "Tripod Dumbbell Row", "Dumbbell Pullover", "Reverse Grip Dumbbell Row", "Dumbbell Bicep Curl", "Dumbbell Hammer Curl"],
        "Day 4: Legs & Core": ["Dumbbell Squat", "Dumbbell Deadlift", "Dumbbell Split Squat", "Dumbbell Hip Thrust", "Dumbbell Calf Raise", "Dumbbell Side Bends", "Plank"],
        "Day 5: Complete Upper Body": ["One Arm Dumbbell Rows", "Dumbbell Arnold Press", "Incline Dumbbell Bench Press", "Chest Supported Dumbbell Row", "Dumbbell Pinwheel Curl", "Overhead Dumbbell Tricep Extension", "Dumbbell Shrug"]
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("This 5-day dumbbell workout split is designed to help you build muscle and strength using only dumbbells. Each day focuses on different muscle groups to ensure a balanced and effective workout routine.")
                }

                Section(header: Text("Workout Schedule")) {
                    ForEach(workoutDaysOrder, id: \.self) { day in
                        if let exercises = workoutDays[day] {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(day)
                                    .font(.headline)
                                    .bold()

                                ForEach(exercises, id: \.self) { exercise in
                                    HStack {
                                        Text(exercise)
                                            .foregroundColor(.orange)
                                            .bold()

                                        Spacer()

                                        Text("4 x 6-10") // Sets x Reps information
                                            .foregroundColor(.black) // Text color changed to black
                                            .bold()
                                    }
                                    .padding(.leading)
                                }
                            }
                        }
                    }
                }

                Section(header: Text("Equipment Needed")) {
                    Text("All you need for this workout is a set of dumbbells. Choose a weight that challenges you while allowing you to maintain proper form throughout each exercise.")
                }

                // Additional sections can be added here if needed
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("5 Day Dumbbell Workout Split", displayMode: .inline)
        }
    }
}

struct MBWorkoutTwo_Previews: PreviewProvider {
    static var previews: some View {
        MBWorkoutTwo()
    }
}
