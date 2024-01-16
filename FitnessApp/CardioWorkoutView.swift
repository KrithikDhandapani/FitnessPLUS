/*
import SwiftUI

struct CardioWorkoutView: View {
    struct WorkoutRoutine {
        var name: String
        var duration: Int // in minutes
    }

    let workoutRoutines: [WorkoutRoutine] = [
        WorkoutRoutine(name: "Running", duration: 20),
        WorkoutRoutine(name: "Jump Rope", duration: 15),
        WorkoutRoutine(name: "Cycling", duration: 30),
        WorkoutRoutine(name: "Elliptical Trainer", duration: 25),
        WorkoutRoutine(name: "Rowing", duration: 18),
        WorkoutRoutine(name: "High-Intensity Interval Training (HIIT)", duration: 15),
        WorkoutRoutine(name: "Swimming", duration: 40),
        WorkoutRoutine(name: "Stair Climbing", duration: 20),
        WorkoutRoutine(name: "Zumba", duration: 25),
        WorkoutRoutine(name: "Boxing", duration: 30)
    ]

    @State private var selectedNavigationTag: Int?
    @State private var lastGeneratedDate: Date?

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.white
                        .edgesIgnoringSafeArea(.all)

                    VStack(alignment: .center) {
                        Text("Today's cardio routine")
                            .font(.title)
                            .padding()
                        // Align to center horizontally
                        Spacer() // Add Spacer to center-align content vertically

                        // Display the randomly generated cardio routines with durations
                        ForEach(generateRandomWorkouts(), id: \.name) { workout in
                            VStack {
                                Text(workout.name)
                                    .font(.title) // Increase text size by 2 units
                                    .foregroundColor(.orange)
                                    .bold() // Bolded orange text
                                    .padding()
                                Text("Duration: \(workout.duration) mins")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom)
                            }
                        }

                        Spacer() // Add Spacer to center-align content vertically
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

    // Function to generate 3 random cardio workouts
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

    // Function to generate 3 new random cardio workouts
    func generateNewWorkouts() -> [WorkoutRoutine] {
        var randomWorkouts: [WorkoutRoutine] = []
        for _ in 1...3 {
            let randomIndex = Int.random(in: 0..<workoutRoutines.count)
            randomWorkouts.append(workoutRoutines[randomIndex])
        }
        return randomWorkouts
    }

    // Function to check the last generated date from UserDefaults
    func checkLastGeneratedDate() {
        if let storedDate = UserDefaults.standard.object(forKey: "lastGeneratedDateCardio") as? Date {
            lastGeneratedDate = storedDate
        }
    }

    // Function to save the last generated date to UserDefaults
    func saveLastGeneratedDate() {
        UserDefaults.standard.set(lastGeneratedDate, forKey: "lastGeneratedDateCardio")
    }
}

struct CardioWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CardioWorkoutView()
    }
}
*/
