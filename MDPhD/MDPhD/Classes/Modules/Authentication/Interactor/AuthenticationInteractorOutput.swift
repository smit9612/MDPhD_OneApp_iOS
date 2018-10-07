//
//  AuthenticationAuthenticationInteractorOutput.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseAuth

protocol AuthenticationInteractorOutput: class {

    func createUser(user: Single<User>)
}
