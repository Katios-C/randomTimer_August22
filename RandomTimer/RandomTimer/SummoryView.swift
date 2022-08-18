

import SwiftUI
import iOSDevPackage

struct SummoryView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @ObservedObject var randomTimerEngine: EngineViewModel
    
    
    var body: some View {
        VStack{
            VStack{
                Text("Теперь сворачивайте приложение и ждите напоминаний, либо вы можете отменить, если передумали")
                    .padding()
                Button("") {
                  //  randomTimerEngine.deleteAllPendingNotifications()
                   // navigation.pop(to: .previous)
                }
                .buttonStyle(CustomButton(text:"Отменить уведомления"))
            }
        }
    }
}
