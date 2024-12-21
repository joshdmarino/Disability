import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var reminderIntervalMinutes: Double {
        didSet {
            UserDefaults.standard.set(reminderIntervalMinutes, forKey: "reminderIntervalMinutes")
        }
    }

    @Published var isNightMode: Bool {
        didSet {
            UserDefaults.standard.set(isNightMode, forKey: "isNightMode")
        }
    }

    @Published var showCatheterCount: Bool {
        didSet {
            UserDefaults.standard.set(showCatheterCount, forKey: "showCatheterCount")
        }
    }

    init() {
        self.reminderIntervalMinutes = UserDefaults.standard.double(forKey: "reminderIntervalMinutes") == 0 ? 300 : UserDefaults.standard.double(forKey: "reminderIntervalMinutes")
        self.isNightMode = UserDefaults.standard.bool(forKey: "isNightMode")
        self.showCatheterCount = UserDefaults.standard.bool(forKey: "showCatheterCount")
    }
}
