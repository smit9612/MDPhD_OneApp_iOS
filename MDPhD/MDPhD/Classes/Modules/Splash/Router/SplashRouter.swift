//
//  SplashSplashRouter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class SplashRouter: SplashRouterInput {

    func showNextScreen(fromView view: SplashViewInput) {
        if let sourceView = view as? SplashViewController, let parent = sourceView.parent as? RootViewController {
            parent.loadAuth()
        }
    }
}
