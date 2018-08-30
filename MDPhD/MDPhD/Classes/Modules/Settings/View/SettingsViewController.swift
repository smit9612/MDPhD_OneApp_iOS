//
//  SettingsSettingsViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInput {

    var output: SettingsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: SettingsViewInput
    func setupInitialState() {
    }
}
