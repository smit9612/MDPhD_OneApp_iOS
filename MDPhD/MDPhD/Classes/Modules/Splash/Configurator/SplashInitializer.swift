//
//  SplashSplashInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SplashModuleInitializer: NSObject {

    //Connect with object on storyboard
    weak var splashViewController: SplashViewController!

    override func awakeFromNib() {
        configureModule()
    }

    func initializeSplashModule() {
        splashViewController = UIStoryboard(storyboard: .splash).instantiateInitialViewController() as? SplashViewController
        configureModule()
    }

    private func configureModule() {
        let configurator = SplashModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: splashViewController)
    }

}
