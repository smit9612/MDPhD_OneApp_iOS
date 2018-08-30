//
//  RootRootConfigurator.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class RootModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RootViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RootViewController) {

        let router = RootRouter()

        let presenter = RootPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RootInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
