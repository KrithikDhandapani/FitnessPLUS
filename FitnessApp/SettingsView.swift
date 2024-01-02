import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: MyProfileView()) {
                Text("My Profile")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(8)
                    .padding(20)
            }

            NavigationLink(destination: GoalsView()) {
                Text("Goals")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(8)
                    .padding(20)
            }

            NavigationLink(destination: WorkoutRoutinesView()) {
                Text("Workout Routines")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(8)
                    .padding(20)
            }

            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
