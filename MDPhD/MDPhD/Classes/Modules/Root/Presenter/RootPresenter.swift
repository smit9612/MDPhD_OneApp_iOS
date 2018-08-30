//
//  RootRootPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class RootPresenter: RootModuleInput, RootViewOutput, RootInteractorOutput {

    weak var view: RootViewInput!
    var interactor: RootInteractorInput!
    var router: RootRouterInput!

    func viewIsReady() {
        // Send to router to router
        // DO Interactor Login to retrieve Entitie
    }
    
    func showAuth() {
        // Splash page loading complete show Auth Page
        router.showAuthentication(fromView: view)
    }

    func showSplash() {
        router.showSplashPage(fromView: view)
    }
}
