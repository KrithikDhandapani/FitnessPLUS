import SwiftUI

struct WeightLiftingWorkoutView: View {
    struct WorkoutRoutine {
        var name: String
        var sets: Int
        var reps: Int
    }

    let workoutRoutines: [WorkoutRoutine] = [
        WorkoutRoutine(name: "Bench Press", sets: 3, reps: 10),
        WorkoutRoutine(name: "Deadlifts", sets: 4, reps: 8),
        WorkoutRoutine(name: "Barbell Squats", sets: 3, reps: 12),
        WorkoutRoutine(name: "Overhead Press", sets: 3, reps: 10),
        WorkoutRoutine(name: "Bent Over Rows", sets: 4, reps: 8),
        WorkoutRoutine(name: "Pull-Ups", sets: 3, reps: 10),
        WorkoutRoutine(name: "Dumbbell Curls", sets: 3, reps: 12),
        WorkoutRoutine(name: "Tricep Dips", sets: 3, reps: 10),
        WorkoutRoutine(name: "Leg Press", sets: 4, reps: 12),
        WorkoutRoutine(name: "Plank", sets: 3, reps: 60)
    ]

    @State private var selectedNavigationTag: Int?
    @State private var lastGeneratedDate: Date?

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack {
                        Text("Today's weightlifting routine")
                            .font(.title)
                            .padding()
                        // Display the randomly generated weightlifting routines with sets and reps
                        ForEach(generateRandomWorkouts(), id: \.name) { workout in
                            VStack {
                                Text(workout.name)
                                    .font(.title) // Increase text size by 2 units
                                    .foregroundColor(.orange)
                                    .bold() // Bolded orange text
                                    .padding()
                                Text("Sets: \(workout.sets), Reps: \(workout.reps)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom)
                            }
                        }

                        Spacer()
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .onAppear {
                        checkLastGeneratedDate()
                    }
                    .navigationBarItems(trailing:
                        NavigationLink(destination: HomeScreenView(), tag: 1, selection: $selectedNavigationTag) {
                            EmptyView()
                        }
                        .isDetailLink(false)
                    )
                }
            }
        }
    }

    // Function to generate 10 random weightlifting routines
    func generateRandomWorkouts() -> [WorkoutRoutine] {
        if shouldGenerateNewWorkouts() {
            lastGeneratedDate = Date()
            return generateNewWorkouts()
        } else {
            return workoutRoutines
        }
    }

    // Function to check if 24 hours have passed since the last generated date
    func shouldGenerateNewWorkouts() -> Bool {
        guard let lastGeneratedDate = lastGeneratedDate else {
            // Generate workouts if it has never been generated before
            return true
        }

        let currentDate = Date()
        let timeDifference = Calendar.current.dateComponents([.hour], from: lastGeneratedDate, to: currentDate)

        return timeDifference.hour ?? 0 >= 24
    }

    // Function to generate 10 new random weightlifting routines
    func generateNewWorkouts() -> [WorkoutRoutine] {
        var randomWorkouts: [WorkoutRoutine] = []
        for _ in 1...10 {
            let randomIndex = Int.random(in: 0..<workoutRoutines.count)
            randomWorkouts.append(workoutRoutines[randomIndex])
        }
        return randomWorkouts
    }

    // Function to check the last generated date from UserDefaults
    func checkLastGeneratedDate() {
        if let storedDate = UserDefaults.standard.object(forKey: "lastGeneratedDate") as? Date {
            lastGeneratedDate = storedDate
        }
    }

    // Function to save the last generated date to UserDefaults
    func saveLastGeneratedDate() {
        UserDefaults.standard.set(lastGeneratedDate, forKey: "lastGeneratedDate")
    }
}

struct WeightLiftingWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WeightLiftingWorkoutView()
    }
}
