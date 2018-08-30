//
//  AuthenticationAuthenticationInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class AuthenticationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var authenticationViewController: AuthenticationViewController!

    override func awakeFromNib() {
        configureModule()
    }

    func initializeAuthModule() {
        authenticationViewController = UIStoryboard(storyboard: .authentication).instantiateInitialViewController() as? AuthenticationViewController
        configureModule()
    }

    private func configureModule() {
        let configurator = AuthenticationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: authenticationViewController)
    }

}
