import SwiftUI

struct AppTabView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()

    var body: some View {
        TabView {
            ContentView(viewModel: settingsViewModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SettingsView(viewModel: settingsViewModel)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}
