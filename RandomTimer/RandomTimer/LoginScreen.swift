//import SwiftUI
//import iOSDevPackage
//
//struct LoginScreen: View {
//    @EnvironmentObject private var navigation: NavigationControllerViewModel
////    private let notificationManager = NotificationManager()
////
////    init() {
////            UNUserNotificationCenter.current().delegate = notificationManager
////        }
//    
//    @StateObject private var randomTimerEngine = EngineViewModel()
//    
//    var body: some View {
//        Button("") {
//            navigation.push(ContentView(randomTimerEngine: randomTimerEngine)) //.environmentObject(notificationManager))
//        }
//        .buttonStyle(CustomButton(text: randomTimerEngine.alertsAmount != 0 ? "Ждите уведомлений" : "Настроить напоминания"))
//        .onAppear{
//            print(randomTimerEngine.alertsAmount)
//        }
//    }
//}
//
//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
