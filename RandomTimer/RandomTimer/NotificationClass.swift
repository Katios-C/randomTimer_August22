import Foundation
import UserNotifications


class NotificationsClass {
    
//    var notifications: [UNNotificationRequest] = []
//    var authorizationStatus: UNAuthorizationStatus?
    
//    func reloadAuthorizationStatus() {
//        UNUserNotificationCenter.current().getNotificationSettings { settings in
//            DispatchQueue.main.async {
//                self.authorizationStatus = settings.authorizationStatus
//            }
//        }
//    }
//
//    func reloadLocalNotifications() {
//        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
//            DispatchQueue.main.async {
//                self.notifications = notifications
//            }
//        }
//    }
    
//    func requestPermission(){
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
////            if success {
////                print("All set!")
////            } else if let error = error {
////                print(error.localizedDescription)
////            }
//            DispatchQueue.main.async {
//                self.authorizationStatus = success ? .authorized: .denied
//            }
//        }
//    }

    
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
    
    
//    func deleteLocalNotifications(identifiers: [String]) {
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//    }
}
