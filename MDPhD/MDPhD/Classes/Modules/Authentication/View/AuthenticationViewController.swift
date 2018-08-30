//
//  AuthenticationAuthenticationViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, AuthenticationViewInput {

    var output: AuthenticationViewOutput!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        output.doLogin()
    }
    // MARK: AuthenticationViewInput
    func setupInitialState() {
    }
}
