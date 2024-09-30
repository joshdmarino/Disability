import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        Form {
            Section(header: Text("Cath Settings")) {
                Toggle("Night Mode", isOn: $viewModel.isNightMode)
                Text("Sets an 8-hour reminder instead of set frequency if you cath between 10 PM and 2 AM.")
                    .font(.caption).italic().foregroundColor(.gray)

                Toggle("Show Catheter Count", isOn: $viewModel.showCatheterCount)
                Text("Toggle to show or hide catheter count on the main screen.")
                    .font(.caption).italic().foregroundColor(.gray)

                Picker("Frequency", selection: $viewModel.reminderIntervalMinutes) {
                    ForEach(Array(stride(from: 240, through: 360, by: 15)), id: \.self) { value in
                        Text("\(value / 60) hours \(value % 60) minutes").tag(Double(value))
                    }
                }
                Text("Select how frequently you want to be reminded to cath.")
                    .font(.caption).italic().foregroundColor(.gray)
            }
        }
    }
}
