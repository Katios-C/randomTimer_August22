import Foundation
import UserNotifications

class EngineViewModel: ObservableObject {
    @Published var text = ""
    @Published var hoursAmount = 0
    @Published var alertsAmount = 0
    @Published var isActive = false
    @Published var notificationAuthStatusDenied = false
    var randomTimerEngine = RandomTimerEngine()
    var notification = NotificationsClass()
    
    @Published private(set) var notifications: [UNNotificationRequest] = []
    @Published private(set) var authorizationStatus: UNAuthorizationStatus?
    @Published var isGranted = false

  
    func timerAlert() -> [Int] {
        isActive = true
        return randomTimerEngine.timeToAlert(hours: hoursAmount, alerts: alertsAmount)
    }
    func startNotification() {
      //  notification.requestPermission()
        notification.wakeMultipleUpNotification(alerts: alertsAmount, sec: timerAlert(), text: text)
    }
    func deleteAllPendingNotifications(){
        notification.deleteAllPendingNotifications()
    }
//    func getNotification() ->  [UNNotificationRequest]{
//      return notification.notifications
//    }
//    
//    func getauthorizationStatus() ->  UNAuthorizationStatus?{
//        return notification.authorizationStatus
//    }
    
//    func requestPermission(){
//        notification.requestPermission()
//    }
//    func reloadLocalNotifications(){
//        notification.reloadLocalNotifications()
//    }
//    func reloadAuthorizationStatus(){
//        notification.reloadAuthorizationStatus()
//        print("reloadAuthorizationStatus")
//    }
    
    func reloadAuthorizationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.authorizationStatus = settings.authorizationStatus
            }
        }
    }
    
    func reloadLocalNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            DispatchQueue.main.async {
                self.notifications = notifications
            }
        }
    }
    
    func requestPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//            if success {
//                print("All set!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
            DispatchQueue.main.async {
                self.authorizationStatus = success ? .authorized: .denied
                self.isGranted = success
                self.determineAuthStatus()
                print(self.isGranted)
            
            }
        }
    }
    
    
    func determineAuthStatus() {
        print("determineAuthStatus")
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                switch settings.authorizationStatus {
                    case .authorized, .provisional, .notDetermined:
                    DispatchQueue.main.async {
                        self.notificationAuthStatusDenied = false
                    print(self.notificationAuthStatusDenied)
                    }
                    case .denied:
                    DispatchQueue.main.async {
                       self.notificationAuthStatusDenied = true
                        self.isGranted = true
                    }
                    print(self.notificationAuthStatusDenied)
                    default:
                        break
                } // End of "switch settings.authorizationStatus {"
            } // End of "{ settings in"
        } // End of determineAuthStatus() func
    
}
