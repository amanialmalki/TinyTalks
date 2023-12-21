//
//  TinyTalksApp.swift
//  TinyTalks
//
//  Created by Amani Almalki on 04/06/1445 AH.
//

import SwiftUI

@main
struct TinyTalksApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var notificationManager = NotificationManager.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(notificationManager) // Provide the NotificationManager to the environment
                .onChange(of: scenePhase) { newScenePhase in
                    switch newScenePhase {
                    case .active:
                        // App has become active, schedule the notification
                        notificationManager.scheduleRestNotification()
                    case .inactive, .background:
                        // App is no longer active, cancel the notification
                        notificationManager.cancelRestNotification()
                    @unknown default:
                        break
                    }
                }
        }
    }
}
