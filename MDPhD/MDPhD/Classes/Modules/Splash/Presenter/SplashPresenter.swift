//
//  SplashSplashPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SplashPresenter: SplashModuleInput, SplashViewOutput, SplashInteractorOutput {

    weak var view: SplashViewInput!
    var interactor: SplashInteractorInput!
    var router: SplashRouterInput!

    func viewIsReady() {
        // DO splash Business Login
        // Setup firebase.

    }

    func buttonTapped() {
        interactor.doSomeThing()
    }

    func didSomeThing() {
        showAuthentication()
    }

    func showAuthentication() {
        router.showNextScreen(fromView: view)
    }
}
