//
//  RandomTimerApp.swift
//  RandomTimer
//
//  Created by Екатерина Чернова on 10.08.2022.
//

import SwiftUI
import iOSDevPackage

@main
struct RandomTimerApp: App {
    @StateObject private var randomTimerEngine = EngineViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationControllerView(transition: .custom(.slide, .slide)) {
               // ContentView()
                SplashView()
//                if randomTimerEngine.isGranted {
//                ContentView()
//                } else {
//                    SettingAuthView(randomTimerEngine: randomTimerEngine)
//                }
               // LoginScreen()
                 
            }
        }
    }
}
