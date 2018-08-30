//
//  SettingsSettingsInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SettingsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var settingsViewController: SettingsViewController!

    override func awakeFromNib() {

        let configurator = SettingsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: settingsViewController)
    }

}
