//
//  RootRootViewInput.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//
import UIKit

protocol RootViewInput: class {

    /**
        @author Smitesh Patel
        Setup initial state of the view
    */

    func setupInitialState()

    func addViewController(_ viewController: UIViewController?)

    func removeCurrentViewController()
}
