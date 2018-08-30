//
//  UIViewController+Extensions.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-06.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Container View
extension UIViewController {

    func addContainerViewController(_ viewController: UIViewController, inView view: UIView) {
        addChild(viewController)
        view.addConstraintSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func removeContainerViewController(_ viewController: UIViewController) {
        viewController.view.removeFromSuperview()
        viewController.willMove(toParent: nil)
        viewController.removeFromParent()
    }

    var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

}
