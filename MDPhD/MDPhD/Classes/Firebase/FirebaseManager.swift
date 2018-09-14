//
//  FirebaseManager.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import FirebaseAuth


typealias Email = String

protocol FirebaseManagerProtocol {
    func getFolders()

    func initializeFirebase()

    func createFirebaseNewUser(email: String, password: String, completion complete: @escaping ((Result<Bool>) -> Void))
}

struct FirebaseAuthManager: FirebaseManagerProtocol {

    func initializeFirebase() {
        
    }

    func createFirebaseNewUser(email: String, password: String, completion complete: @escaping ((Result<Bool>) -> Void)) {
        // Check if user is alreadySignUp
        guard isUserRegisteredFor(email: email) else {
            complete(.failure(.userAlreadyRegistered))
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                complete(.failure(.firebaseError))
                return
            }
            complete(.success(true))
        }
    }

    private func isUserRegisteredFor(email: Email) -> Bool {
        return false
    }

    func getFolders() {
        // TODO get folders from Firebase
    }

    func createFolder() {

    }

    func deleteFolder() {

    }

    func updateFolder() {

    }
}
