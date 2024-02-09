import SwiftUI

struct STWorkoutOne: View {
    let workoutDaysOrder = [
        "Day 1: Chest & Abs",
        "Day 2: Back",
        "Day 3: Shoulders",
        "Day 4: Arms",
        "Day 5: Legs",
        "Day 6: Cardio",
        "Day 7: Rest"
    ]
    
    let workoutDays = [
        "Day 1: Chest & Abs": [
            "Incline Barbell Bench Press",
            "Dumbbell Fly",
            "Weighted Dip",
            "Pec-Deck",
            "Cable Crossover",
            "Pushup",
            "Hanging Leg Raise",
            "Decline Situp",
            "Side Bends",
            "Plank",
            "Rope Crunch"
        ],
        "Day 2: Back": [
            "Neutral Grip Pullups",
            "Bent Over Barbell Row",
            "Reverse Grip Pulldown",
            "Straight Arm Pulldown",
            "Wide Grip Seated Row",
            "Rack Deadlift"
        ],
        "Day 3: Shoulders": [
            "Upright Row",
            "Seated Lateral Raise",
            "Seated Smith Machine Shoulder Press",
            "Front Plate Raise",
            "High Rope Face Pull"
        ],
        "Day 4: Arms": [
            "EZ Bar Preacher Curl",
            "Close Grip Bench Press",
            "Hammer Curl",
            "Overhead Rope Extension",
            "Standing Cable Curl",
            "Reverse Grip Pushdown"
        ],
        "Day 5: Legs": [
            "Squat",
            "Leg Press",
            "Single Leg Extension",
            "Stiff-Legged Deadlift",
            "Seated Leg Curl",
            "Lying Leg Curl",
            "Standing Calf Raise",
            "Seated Calf Raise"
        ],
        "Day 6: Cardio": [
            "High Intensity Interval Training (HIIT Style) for 20 total minutes"
        ],
        "Day 7: Rest": []
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("While you might not be using the extra plates and bigger dumbbells like you were during your bulk, you will still be going heavy and upping the intensity. This five day split won’t be a traditional program. You’re going to push yourself in a variety of ways to develop that muscle while etching out the detail that you need to create that shredded look.")
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
                    Text("Barbell\nBodyweight\nCables\nDumbbells\nEZ Bar\nMachines")
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
