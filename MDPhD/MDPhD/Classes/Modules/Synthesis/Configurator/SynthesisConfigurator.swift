//
//  SynthesisSynthesisConfigurator.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SynthesisModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SynthesisViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SynthesisViewController) {

        let router = SynthesisRouter()

        let presenter = SynthesisPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SynthesisInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
