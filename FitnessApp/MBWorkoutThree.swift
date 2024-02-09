import SwiftUI
import URLImage // Assuming this import is necessary for your broader project

struct MBWorkoutThree: View {
    // Placeholder workout days and exercises
    let workoutDaysOrder = ["Day 1: Back and Biceps", "Day 2: Chest and Triceps", "Day 3: Rest", "Day 4: Quads, Hamstrings, Calves", "Day 5: Shoulders, Traps, Forearms"]
    let workoutDays = [
        "Day 1: Back and Biceps": ["Deadlift", "One Arm Dumbbell Row", "Wide Grip Pull Up", "Barbell Row", "Seated Cable Row", "EZ Bar Preacher Curl", "Concentration Curl", "Seated Dumbbell Curl"],
        "Day 2: Chest and Triceps": ["Bench Press", "Incline Dumbbell Bench Press", "Chest Dip", "Cable Crossover", "Machine Press", "EZ Bar Skullcrusher", "Two Arm Seated Dumbbell Extension", "Cable Tricep Extension"],
        "Day 3: Rest": [],
        "Day 4: Quads, Hamstrings, Calves": ["Squat", "Leg Press", "Dumbbell Lunge", "Leg Extension", "Stiff Leg Deadlift", "Leg Curl", "Standing Calf Raise", "Seated Calf Raise"],
        "Day 5: Shoulders, Traps, Forearms": ["Seated Barbell Press", "Seated Arnold Press", "Dumbbell Lateral Raise", "Hammer Strength Press", "Upright Row", "Dumbbell Shrug", "Seated Barbell Wrist Curl"]
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    Text("This 4-day maximum mass workout is designed to help you gain muscle mass and strength. The program incorporates compound exercises and progressive overload to stimulate muscle growth.")
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
                                        
                                        Text("4 x 6-10") // Uniform sets x reps
                                            .foregroundColor(.black)
                                            .bold()
                                    }
                                    .padding(.leading)
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Equipment Needed")) {
                    Text("For this workout, you will need standard gym equipment, including barbells, dumbbells, and a power rack. Make sure to use challenging weights while maintaining proper form.")
                }
                
                // Additional sections like tips can be added here
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("4 Day Maximum Mass Workout", displayMode: .inline)
        }
    }
}

struct MBWorkoutThree_Previews: PreviewProvider {
    static var previews: some View {
        MBWorkoutThree()
    }
}
