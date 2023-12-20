import SwiftUI
import HealthKit

struct ActivityTrackerView: View {
    @State private var stepCount = 0
    @State private var heartRate = 0
    @State private var caloriesConsumed = 0
    @State private var caloriesBurnt = 0
    @State private var healthStore = HKHealthStore()

    var body: some View {
        VStack {
            Spacer()

            Text("Activity Tracker")
                .font(.title)
                .padding()

            Text("Steps: \(stepCount)")
                .padding()

            Text("Heart Rate: \(heartRate)")
                .padding()

            Text("Calories Consumed: \(caloriesConsumed)")
                .padding()

            Text("Calories Burnt: \(caloriesBurnt)")
                .padding()

            Spacer()

            Button("Refresh Data") {
                fetchData()
            }
            .padding()

            Spacer()
        }
        .onAppear {
            requestAuthorization()
            fetchData()
        }
    }

    private func requestAuthorization() {
        let types: Set<HKSampleType> = [
            HKSampleType.quantityType(forIdentifier: .stepCount)!,
            HKSampleType.quantityType(forIdentifier: .heartRate)!,
            HKSampleType.quantityType(forIdentifier: .dietaryEnergyConsumed)!,
            HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]

        healthStore.requestAuthorization(toShare: nil, read: types) { _, _ in }
    }

    private func fetchData() {
        fetchStepCount()
        fetchHeartRate()
        fetchCaloriesConsumed()
        fetchCaloriesBurnt()
    }

    private func fetchStepCount() {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)

        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKStatisticsQuery(
            quantityType: HKSampleType.quantityType(forIdentifier: .stepCount)!,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else { return }

            DispatchQueue.main.async {
                self.stepCount = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }

        healthStore.execute(query)
    }

    private func fetchHeartRate() {
        let query = HKStatisticsQuery(
            quantityType: HKSampleType.quantityType(forIdentifier: .heartRate)!,
            quantitySamplePredicate: nil,
            options: .discreteAverage
        ) { _, result, _ in
            guard let result = result, let average = result.averageQuantity() else { return }

            DispatchQueue.main.async {
                self.heartRate = Int(average.doubleValue(for: HKUnit.init(from: "count/min")))
            }
        }

        healthStore.execute(query)
    }

    private func fetchCaloriesConsumed() {
        let query = HKStatisticsQuery(
            quantityType: HKSampleType.quantityType(forIdentifier: .dietaryEnergyConsumed)!,
            quantitySamplePredicate: nil,
            options: .cumulativeSum
        ) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else { return }

            DispatchQueue.main.async {
                self.caloriesConsumed = Int(sum.doubleValue(for: HKUnit.kilocalorie()))
            }
        }

        healthStore.execute(query)
    }

    private func fetchCaloriesBurnt() {
        let query = HKStatisticsQuery(
            quantityType: HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!,
            quantitySamplePredicate: nil,
            options: .cumulativeSum
        ) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else { return }

            DispatchQueue.main.async {
                self.caloriesBurnt = Int(sum.doubleValue(for: HKUnit.kilocalorie()))
            }
        }

        healthStore.execute(query)
    }
}

struct ActivityTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTrackerView()
    }
}
