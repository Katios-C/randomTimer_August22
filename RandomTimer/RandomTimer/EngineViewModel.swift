import Foundation


class EngineViewModel: ObservableObject {
    @Published var text = ""
    @Published var hoursAmount = 0
    @Published var alertsAmount = 0
    @Published var isActive = false
    
    var randomTimerEngine = RandomTimerEngine()
    var notification = NotificationsClass()
    
    private var endDate = Date()
    
    
    func timerAlert() -> [Int] {
        isActive = true
        return randomTimerEngine.timeToAlert(hours: hoursAmount, alerts: alertsAmount)
    }
    func startNotification() {
        notification.requestPermission()
        notification.wakeMultipleUpNotification(alerts: alertsAmount, sec: timerAlert(), text: text)
    }
    func deleteAllPendingNotifications(){
        notification.deleteAllPendingNotifications()
    }
//    func requestPermission(){
//        notification.requestPermission()
//    }
}
