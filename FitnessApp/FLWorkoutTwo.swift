import SwiftUI

struct FLWorkoutTwo: View {
    let workoutDaysOrder = ["Monday : Chest and Triceps", "Tuesday : Abs and Cardio", "Wednesday : Back and Biceps", "Thursday : Abs and Cardio", "Friday : Legs and Shoulders", "Saturday : Abs and Cardio", "Sunday : Rest"]

    
    let workoutDays = [
        "Monday : Chest and Triceps": ["Dumbbell Bench Press", "Incline Bench Press", "Cable Cross Over", "Close Grip Bench Press", "Lying Tricep Extension", "Rope Pulldowns"],
        "Tuesday : Abs and Cardio": ["1 Hour of Low Intensity Cardio", "Lying Floor Leg Raise", "Cable Crunch", "Plank"],
        "Wednesday : Back and Biceps": ["Wide Grip Pull Up", "Close Grip Pull Down", "Cable Row", "Barbell Curl", "Incline Bench Dumbbell Curl", "Dumbbell Preacher Curl"],
        "Thursday : Abs and Cardio": ["1 hour of low intensity cardio", "Lying Floor Leg Raise", "Cable Crunch", "Weighted Crunch", "Plank"],
        "Friday : Legs and Shoulders" : ["Squat", "Stiff Legged Deadlift","Leg Curl", "Leg Extension", "Standing Calf Raise", "Military Press", "Dumbbell Lateral Raise", "Bent Over Rev Fly"],
        "Saturday : Abs and Cardio": ["1 hour of low intensity cardio", "Lying Floor Leg Raise", "Cable Crunch", "Weighted Crunch", "Plank"],
        "Sunday : Rest" : []
        // Add other days...
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("This workout is designed for people who have finished bulking and have some excess fat they'd like to lose. It combines heavy weight training with 3 days of cardio, and 1 day of rest. The choice of cardio is yours, whatever works for you. You can use low intensity early morning cardio or HIIT (high intensity interval training) in the evenings.With this workout you get out what you put in. Your diet is more important that your workout. Make sure you're around 500 calories per day deficient.")
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
                    Text("Barbell\nDumbbells\nBench\nCable Machine\nCardio Machine")
                }
            }
            .padding()
            .navigationBarTitle("Workout Details", displayMode: .inline)
        }
    }
}


struct FLWorkoutTwo_Previews: PreviewProvider {
    static var previews: some View {
        FLWorkoutTwo()
    }
}
