//
//  UIStoryboardIdentifiable.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//


import Foundation
import UIKit

protocol UIStoryboardIdentifiable {

    static var storyboardIdentifier: String { get }
}

extension UIViewController: UIStoryboardIdentifiable {}

extension UIStoryboardIdentifiable where Self: UIViewController {

    static var storyboardIdentifier : String {
        return String(describing: self)
    }
}
