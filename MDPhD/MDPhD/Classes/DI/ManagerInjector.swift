//
//  ManagerInjector.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

protocol ManagerInjected {}

extension ManagerInjected {

    var networkManager: NetworkManagerProtocol {
        return ManagerInjector.networkManager
    }

    var firebaseManager: FirebaseManagerProtocol {
        return ManagerInjector.firebaseAuthManager
    }
}

struct ManagerInjector {

    static var networkManager: NetworkManagerProtocol = NetworkManager()
    static var firebaseAuthManager: FirebaseManagerProtocol = FirebaseAuthManager()
}
