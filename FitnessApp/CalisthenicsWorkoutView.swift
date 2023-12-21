import SwiftUI

struct CalisthenicsWorkoutView: View {
    struct WorkoutRoutine {
        var name: String
        var sets: Int
        var reps: Int
    }

    let workoutRoutines: [WorkoutRoutine] = [
        WorkoutRoutine(name: "Push-ups", sets: 3, reps: 15),
        WorkoutRoutine(name: "Squats", sets: 4, reps: 12),
        WorkoutRoutine(name: "Planks", sets: 3, reps: 30),
        WorkoutRoutine(name: "Jumping Jacks", sets: 3, reps: 20),
        WorkoutRoutine(name: "Lunges", sets: 4, reps: 12),
        WorkoutRoutine(name: "Burpees", sets: 3, reps: 10),
        WorkoutRoutine(name: "Sit-ups", sets: 3, reps: 15),
        WorkoutRoutine(name: "Mountain Climbers", sets: 3, reps: 20)
    ]

    @State private var selectedNavigationTag: Int?
    @State private var lastGeneratedDate: Date?

    var body: some View {
        NavigationView {
            VStack {
                Text("Today's workout routine")
                    .font(.largeTitle)
                    .padding()

                // Display the randomly generated workout routines with sets and reps
                ForEach(generateRandomWorkouts(), id: \.name) { workout in
                    VStack {
                        Text(workout.name)
                            .font(.headline)
                            .padding()
                        Text("Sets: \(workout.sets), Reps: \(workout.reps)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom)
                    }
                }

                Spacer()
            }
            .navigationBarTitle("Workout", displayMode: .inline)
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

    // Function to generate 6 random workout routines
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

    // Function to generate 6 new random workout routines
    func generateNewWorkouts() -> [WorkoutRoutine] {
        var randomWorkouts: [WorkoutRoutine] = []
        for _ in 1...6 {
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

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CalisthenicsWorkoutView()
    }
}
