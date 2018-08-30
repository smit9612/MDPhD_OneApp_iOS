//
//  LibraryLibraryConfigurator.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class LibraryModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LibraryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LibraryViewController) {

        let router = LibraryRouter()

        let presenter = LibraryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LibraryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
