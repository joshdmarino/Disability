import SwiftUI
import UserNotifications

struct TimerView: View {
    @Binding var timerEnd: Date?
    @State private var timerString = "00:00:00"
    @State private var hasScheduledNotification = false // State to track notification scheduling

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(timerString)
            .onReceive(timer) { _ in
                updateTimer()
            }
    }

    func updateTimer() {
        guard let end = timerEnd else { return }
        let remaining = Int(end.timeIntervalSinceNow)
        if remaining > 0 {
            let hours = remaining / 3600
            let minutes = (remaining % 3600) / 60
            let seconds = remaining % 60
            timerString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            hasScheduledNotification = false // Reset flag as timer is still running
        } else if !hasScheduledNotification {
            timerString = "00:00:00"
            scheduleNotification()  // Schedule notification only once when the timer reaches zero
            hasScheduledNotification = true // Set flag to prevent rescheduling
        }
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time to Cath!"
        content.body = "Your catheterization timer has ended. It's time to cath."
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "cathTimerEnded", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}
