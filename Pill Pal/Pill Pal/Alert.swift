//
//  Alert.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/26/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation
import UserNotifications

// Starting with default text to edit later.
class Alerts {
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }

    @objc func scheduleLocal() {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Time to take your pills"
        // Configure THESE to include list of pills that should be taken today.
        content.body = "You need to take THESE pills"
        content.categoryIdentifier = "morningPills"
        // Not sure what this does yet.
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default

        // Need to configure this for all of the different frequencies
        var dateComponents = DateComponents()
        dateComponents.hour = 09
        dateComponents.minute = 00
        // Actual calendar trigger
        // let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Extra trigger for testing purposes
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }

}
