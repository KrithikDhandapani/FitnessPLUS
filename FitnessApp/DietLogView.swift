import SwiftUI

struct DietLogView: View {
    // Structure to represent a food log entry
    struct FoodLogEntry {
        var foodName: String
        var calories: Int
        var protein: Int
    }

    // Sample list of food log entries
    @State private var foodLogs: [FoodLogEntry] = [
        FoodLogEntry(foodName: "Chicken Breast", calories: 150, protein: 30),
        FoodLogEntry(foodName: "Broccoli", calories: 50, protein: 5),
        // Add more entries or remove these sample entries as needed
    ]

    // State variables to capture user input
    @State private var foodName = ""
    @State private var calories = ""
    @State private var protein = ""

    var body: some View {
        VStack {
            // Title
            Text("Food Logger")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.orange)

            // Display the list of food log entries
            List(foodLogs, id: \.foodName) { entry in
                VStack(alignment: .leading) {
                    Text("Food: \(entry.foodName)")
                        .font(.headline)
                        .foregroundColor(.orange)
                    Text("Calories: \(entry.calories) kcal")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                    Text("Protein: \(entry.protein) g")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                }
                .padding()
            }

            // Form to add a new food log entry
            Form {
                Section(header: Text("Add New Entry")) {
                    TextField("Food Name", text: $foodName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.orange)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 1))
                        .background(Color.white)

                    TextField("Calories", text: $calories)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .foregroundColor(.orange)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 1))
                        .background(Color.white)

                    TextField("Protein (g)", text: $protein)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .foregroundColor(.orange)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.orange, lineWidth: 1))
                        .background(Color.white)

                    Button("Log Food") {
                        // Validate and add the new entry to the list
                        if let caloriesValue = Int(calories),
                           let proteinValue = Int(protein),
                           !foodName.isEmpty {
                            let newEntry = FoodLogEntry(foodName: foodName, calories: caloriesValue, protein: proteinValue)
                            foodLogs.append(newEntry)

                            // Clear the input fields after logging
                            foodName = ""
                            calories = ""
                            protein = ""
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.white) // Set the background color to white
        }
        .navigationBarTitle("Diet Log", displayMode: .inline)
    }
}

struct DietLogView_Previews: PreviewProvider {
    static var previews: some View {
        DietLogView()
    }
}
