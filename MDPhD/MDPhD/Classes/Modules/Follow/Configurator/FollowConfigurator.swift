//
//  FollowFollowConfigurator.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class FollowModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FollowViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FollowViewController) {

        let router = FollowRouter()

        let presenter = FollowPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FollowInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
