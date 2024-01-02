import SwiftUI

// DataPoint struct to represent each data point
struct DataPoint {
    var label: String
    var value: Double
}

// ChartData struct to hold an array of DataPoints
struct ChartData {
    var points: [DataPoint]
}

// BarChartView to display a bar chart with the provided data
struct BarChartView: View {
    var data: ChartData
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(data.points, id: \.label) { dataPoint in
                        VStack {
                            Text(dataPoint.label)
                                .foregroundColor(.orange)
                                .padding(.bottom, 5)

                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.orange)
                                .frame(width: 40, height: CGFloat(dataPoint.value), alignment: .bottom)
                        }
                    }
                }
                .padding(20)
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Statistics", displayMode: .inline)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(data: ChartData(points: [
            DataPoint(label: "Calories", value: 500),
            DataPoint(label: "Protein", value: 100),
            DataPoint(label: "Steps", value: 7500),
            DataPoint(label: "Sleep", value: 7)
        ]), title: "Statistics")
    }
}
