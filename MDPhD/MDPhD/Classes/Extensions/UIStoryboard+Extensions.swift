//
//  UIStoryboard+Extensions.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {

    enum Storyboard: String {
        case splash = "Splash"
        case onboarding = "Onboarding"
        case authentication = "Authentication"
        case home = "Home"
        case main = "Main"
    }

    func instatiateViewController<T : UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        return viewController
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
}
