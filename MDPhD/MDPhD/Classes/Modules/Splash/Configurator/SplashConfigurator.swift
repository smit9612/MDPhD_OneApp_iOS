//
//  SplashSplashConfigurator.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SplashModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SplashViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SplashViewController) {

        let router = SplashRouter()

        let presenter = SplashPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SplashInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
