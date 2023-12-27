//
//  NotificationManager.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 07/06/1445 AH.
//

import Foundation
import SwiftUI
import UserNotifications

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    private let restNotificationIdentifier = "restNotification"
    func scheduleRestNotification() {
        
        let content = UNMutableNotificationContent()
//           content.title = "Take a Break"
//           content.body = "You've been using the app for a while. Time to rest your eyes and stretch your legs."
//           content.sound = UNNotificationSound.default
        content.title = NSLocalizedString("Take a Break", comment: " ")
                content.body = NSLocalizedString("You've been using the app for a while. Time to rest your eyes and stretch your legs.", comment: " ")
                content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
               
        let request = UNNotificationRequest(identifier: restNotificationIdentifier, content: content, trigger: trigger)
        print("Scheduling notification in 60 seconds")
        
           UNUserNotificationCenter.current().add(request) { error in
               if let error = error {
                   print("Error scheduling notification: \(error)")
               } else {
                   print("Notification scheduled!")
               }
           }
       }
   
    func cancelRestNotification() {
           UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [restNotificationIdentifier])
       }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Displaying the iOS local notification when the app is in the foreground
        completionHandler([.banner, .badge, .sound])
    }
}
