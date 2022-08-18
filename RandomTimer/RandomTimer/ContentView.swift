

import SwiftUI
import iOSDevPackage

struct ContentView: View {
    @StateObject private var randomTimerEngine = EngineViewModel()
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    @State private var showingAlert = false
    @State private var isCreatePresented = false
    @State var showSplash = true
    
    
    var body: some View {
        ZStack{
            VStack {
            if randomTimerEngine.notificationAuthStatusDenied {

                InfoOverlayView(
                    infoMessage: "Please Enable Notification Permission In Settings",
                    buttonTitle: "Settings",
                    systemImageName: "gear",
                    action: {

                        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                )

            } else {
                VStack{
                      VStack{
                        VStack {
                            Text(hoursTimerIsActiveString)
                                .padding()
                                .font(.body)
                                .foregroundColor(.gray)

                            Text("\(randomTimerEngine.hoursAmount)")
                                .font(.title)


                            Stepper("", value: $randomTimerEngine.hoursAmount, in: 0...24)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color.red)
                        }

                        VStack {
                            Text(howMuchAlertsWantGetString)
                                .padding()
                                .font(.body)
                                .foregroundColor(.gray)

                            Text("\(randomTimerEngine.alertsAmount)")
                                .font(.title)


                            Stepper("", value: $randomTimerEngine.alertsAmount, in: 0...100)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color.red)
                        }
                    }

                    TextField(inputTextString, text: $randomTimerEngine.text)
                        .textFieldStyle(.roundedBorder)
                        .padding()

                    //
                    //            Button("") {
                    //                randomTimerEngine.requestPermission()
                    //            }
                    //            .buttonStyle(CustomButton(text:"Разрешить уведомление"))


                    Button("") {
                        if randomTimerEngine.hoursAmount > 0 && randomTimerEngine.alertsAmount > 0 {
                            randomTimerEngine.startNotification()
                            // navigation.pop(to: .previous)
                            navigation.push(SummoryView(randomTimerEngine: randomTimerEngine))
                        } else {
                            showingAlert = true
                            print(stringCanNotBeEmpty)
                        }
                    }
                    .alert(stringCanNotBeEmpty, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .buttonStyle(CustomButton(text:"Старт"))


                }

                //        .overlay(randomTimerEngine.notificationAuthStatusDenied ? infoOverlayView as! EmptyView : EmptyView())
                .onAppear{
                    randomTimerEngine.reloadAuthorizationStatus()
                    //    randomTimerEngine.determineAuthStatus()

                }
                .onChange(of: randomTimerEngine.authorizationStatus) { authorizationStatus in
                    switch authorizationStatus {
                    case .notDetermined:
                        randomTimerEngine.requestPermission()
                    case .authorized:
                        randomTimerEngine.reloadLocalNotifications()
                    default:
                        break
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    randomTimerEngine.reloadAuthorizationStatus()
                }
            }
            }
//            SplashScreen()
//              .opacity(showSplash ? 1 : 0)
//                .onAppear{
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                         SplashScreen.shouldAnimate = false
//                         withAnimation() {
//                           self.showSplash = false
//                         }
//                       }
//                }
        }
        .onAppear{
            randomTimerEngine.determineAuthStatus()
         
        }
    }
}
