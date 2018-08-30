//
//  RootRootRouter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class RootRouter: RootRouterInput {

    func showSplashPage(fromView view: RootViewInput) {
        let splashModuleInitalizer = SplashModuleInitializer()
        splashModuleInitalizer.initializeSplashModule()
        if let sourceView = view as? RootViewController {
            sourceView.addViewController(splashModuleInitalizer.splashViewController)
        }
    }

    func showAuthentication(fromView view: RootViewInput) {
        let authModuleInitalizer = AuthenticationModuleInitializer()
        authModuleInitalizer.initializeAuthModule()
        if let sourceView = view as? RootViewController {
            sourceView.addViewController(authModuleInitalizer.authenticationViewController)
        }
    }
}
