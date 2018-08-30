//
//  SegueHandler.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-09.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHandler {

    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {

    func performSegue(withIdentifier segueIdentifier: SegueIdentifier, sender: AnyObject? = nil) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }

    func segueIdentifier(forSegue segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid segue identifier \(String(describing: segue.identifier)).")
        }
        return segueIdentifier
    }
}
