//
//  AuthViewModel.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-09.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

struct AuthFormViewModel {
    //data
    let userName: Observable<String> = Observable()
    let password: Observable<String> = Observable()

    //interactions
    let showUserNameError: Observable<Bool> = Observable(false)
    let showPasswordError: Observable<Bool> = Observable(false)

}
