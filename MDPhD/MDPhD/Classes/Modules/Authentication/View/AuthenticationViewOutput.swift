//
//  AuthenticationAuthenticationViewOutput.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

protocol AuthenticationViewOutput {

    /**
        @author Smitesh Patel
        Notify presenter that view is ready
    */

    func viewIsReady()

    func doLogin()
}
