import Foundation
import UserNotifications


class NotificationsClass {
    func requestPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    
    func wakeMultipleUpNotification(alerts: Int, sec: [Int], text: String ){

        let groupID = "Group 1"
        for index in 0..<alerts{
            let content = UNMutableNotificationContent()
            content.title = "Обрати внимание"
            content.subtitle = text
            content.body = "\(index)"
            content.threadIdentifier = groupID
            content.sound = UNNotificationSound.default
        
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(sec[index]), repeats: false)
            let id = "reminder - \(UUID())"
            let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        }
    }
    
    func deleteAllPendingNotifications(){
               UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
           }
}
