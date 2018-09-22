//
//  AuthViewModel.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-09.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import RxSwift

struct AuthFormViewModel {
    
    var userName: Variable<String?> = Variable<String?>("")
    var password: Variable<String?> = Variable<String?>("")

    let showUserNameError = Variable<Bool>(false)
    let showPasswordError = Variable<Bool>(false)
}
