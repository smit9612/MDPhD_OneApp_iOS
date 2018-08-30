//
//  RootRootViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController, RootViewInput {

    var output: RootViewOutput!
    private var currentViewController: UIViewController?
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        loadSplash()
    }

    func loadSplash() {
        output.showSplash()
    }

    func loadAuth() {
        output.showAuth()
    }

    // MARK: RootViewInput
    func setupInitialState() {

    }
}


// MARK: - Private Methods
extension RootViewController {

    func removeCurrentViewController() {
        if let currentViewController = currentViewController {
            dismiss(animated: false, completion: nil)
            removeContainerViewController(currentViewController)
        }
    }

    func addViewController(_ viewController: UIViewController?) {
        removeCurrentViewController()
        currentViewController = viewController
        if let currentViewController = currentViewController {
            addContainerViewController(currentViewController, inView: view)
        }
    }
}
