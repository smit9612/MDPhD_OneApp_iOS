//
//  RootRootInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class RootModuleInitializer: NSObject {

    //Connect with object on storyboard
    var rootViewController: RootViewController?

    override func awakeFromNib() {
        configureModule()
    }

    func initializeRootModule() {
        rootViewController = UIStoryboard(storyboard: .main).instantiateInitialViewController() as? RootViewController
        configureModule()
    }

    private func configureModule() {
        let configurator = RootModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: rootViewController)
    }


}
