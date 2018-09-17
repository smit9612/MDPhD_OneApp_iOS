//
//  AuthenticationAuthenticationConfigurator.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class AuthenticationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AuthenticationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AuthenticationViewController) {

        let router = AuthenticationRouter()

        let presenter = AuthenticationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AuthenticationInteractor()
        interactor.output = presenter
        interactor.viewModel = AuthFormViewModel()
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
