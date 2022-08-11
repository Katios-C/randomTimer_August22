//
//  RandomTimerApp.swift
//  RandomTimer WatchKit Extension
//
//  Created by Екатерина Чернова on 10.08.2022.
//

import SwiftUI

@main
struct RandomTimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
