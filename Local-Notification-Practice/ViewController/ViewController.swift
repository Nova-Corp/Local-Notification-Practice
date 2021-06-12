//
//  ViewController.swift
//  Local-Notification-Practice
//
//  Created by ADMIN on 12/06/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func didTapLocalNotificationButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Local Notification", message: nil, preferredStyle: .actionSheet)
        alertController.pruneNegativeWidthConstraints()
        let setLocalNotificationAction = UIAlertAction(title: "Set", style: .default) { (action) in
            LocalNotificationManager.setNotification(5, of: .seconds, repeats: false, title: "Hello", body: "local", userInfo: ["aps" : ["hello" : "world"]])
        }
        let removeLocalNotificationAction = UIAlertAction(title: "Remove", style: .default) { (action) in
            LocalNotificationManager.cancel()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
        alertController.addAction(setLocalNotificationAction)
        alertController.addAction(removeLocalNotificationAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

