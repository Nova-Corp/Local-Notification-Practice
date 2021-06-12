//
//  UIAlertController+Extension.swift
//  Local-Notification-Practice
//
//  Created by ADMIN on 12/06/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
