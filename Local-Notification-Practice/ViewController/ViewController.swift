//
//  ViewController.swift
//  Local-Notification-Practice
//
//  Created by ADMIN on 12/06/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showActivityIndicator(message: "Failed to register for remote notifications: remote notifications are not supported in the simulator")
        
    }
    
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

var activityView: UIActivityIndicatorView?
var activityBgView: UIView?

extension UIViewController {
    //MARK:- Activity Indicator Action
    func showActivityIndicator(backgroundColor: UIColor = .black,
                               activityViewColor: UIColor = .white,
                               duration: Double? = nil,
                               message: String = "",
                               messageColor: UIColor = .white) {
        activityBgView = UIView()
        activityBgView?.backgroundColor = backgroundColor.withAlphaComponent(0.5)
        activityBgView?.frame = view.frame
        view.addSubview(activityBgView!)
        
        activityView = UIActivityIndicatorView(style: .white)
        activityView?.color = activityViewColor
        activityView?.center = activityBgView!.center
        activityBgView?.addSubview(activityView!)
        activityView?.startAnimating()
        
        let messageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textColor = messageColor
            label.text = message
            label.textAlignment = .center
            return label
        }()
        
        activityBgView?.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: activityView!.bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: activityBgView!.leadingAnchor, constant: 15),
            messageLabel.centerXAnchor.constraint(equalTo: activityBgView!.centerXAnchor)
        ])
        
        if let duration = duration {
            DispatchQueue.main.asyncAfter(deadline: .now()+duration) {[weak self] in
                self?.hideActivityIndicator()
            }
        }
    }

    func hideActivityIndicator(){
        if activityView != nil{
            activityBgView?.removeFromSuperview()
            activityView?.stopAnimating()
        }
    }
}
