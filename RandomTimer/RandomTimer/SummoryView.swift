

import SwiftUI
import iOSDevPackage

struct SummoryView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @ObservedObject var randomTimerEngine: EngineViewModel
    
    
    var body: some View {
        VStack{
            VStack{
                Button("") {
                  //  randomTimerEngine.deleteAllPendingNotifications()
                   // navigation.pop(to: .previous)
                }
                .buttonStyle(CustomButton(text:"Отменить уведомления"))
            }
        }
    }
}
