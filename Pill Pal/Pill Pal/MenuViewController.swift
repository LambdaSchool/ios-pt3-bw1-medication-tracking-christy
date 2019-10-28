//
//  MenuViewController.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
// MARK: - Outlets
    
    @IBOutlet weak var instructionsButton: UIButton!
    @IBOutlet weak var addPillsButton: UIButton!
    @IBOutlet weak var viewPillsButton: UIButton!
    @IBOutlet weak var nextPillButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionsButton.clipsToBounds = true
        addPillsButton.clipsToBounds = true
        viewPillsButton.clipsToBounds = true
        nextPillButton.clipsToBounds = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let instructionHeight = instructionsButton.bounds.height
        
        instructionsButton.layer.cornerRadius = instructionHeight/2.0
        addPillsButton.layer.cornerRadius = addPillsButton.bounds.height/2.0
        viewPillsButton.layer.cornerRadius = viewPillsButton.bounds.height/2.0
        nextPillButton.layer.cornerRadius = nextPillButton.bounds.height/2.0
    }
    
    @IBAction func registerForNotifications(_ sender: UIBarButtonItem) {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    @IBAction func scheduleNotifications(_ sender: UIBarButtonItem) {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Time to take your pills"
        // Configure THESE to include list of pills that should be taken today.
        content.body = "You need to take 1 Prescription and 2 Vitamin pills"
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
