//
//  AuthenticationAuthenticationInteractorInput.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import Foundation
import Action

protocol AuthenticationInteractorInput {

    var viewModel: AuthFormViewModel! { get }
    
    func doLogin()
}
