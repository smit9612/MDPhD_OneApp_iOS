//
//  LoginService.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-09-22.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import RxSwift


protocol LoginServiceProtocol {

    func signIn(withCredential credential: AuthCredential) -> Observable<User>
    func signIn(withEmail emailAuth: EmailAuth) -> Observable<User>
    func createAccount(with emailAuth: EmailAuth) -> Single<User>
}

enum MDPhDDatabaseReference: String {

    case user
    case folder
    case institutions
    case userAnalysis = "user-analysis"
    case userCart = "user-cart"
    case userFolder = "user-folder"
    case userNotificaton = "user-notification"
    case userQuery = "user-query"
    case userReport = "user-report"
}

struct EmailAuth {
    let email: String
    let password: String
}

struct LoginService: FirebaseCRUD, LoginServiceProtocol {
    
    /** Database user's reference. */
    private var usersReference: DatabaseReference {
        return rootReference.child(MDPhDDatabaseReference.user.rawValue)
    }

    func signIn(withCredential credential: AuthCredential) -> Observable<User> {
        return Observable.create { observer in
            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                guard let authResult = authResult else {
                    observer.onError(error!)
                    return
                }
                observer.onNext(authResult.user)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    func signIn(withEmail emailAuth: EmailAuth) -> Observable<User> {
        return Observable.create { observer in
            Auth.auth().signIn(withEmail: emailAuth.email, password: emailAuth.password) { (authResult, error) in
                guard let authResult = authResult else {
                    observer.onError(error!)
                    return
                }
                observer.onNext(authResult.user)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    func createAccount(with emailAuth: EmailAuth) -> Single<User> {
        return Single.create { single in
            Auth.auth().createUser(withEmail: emailAuth.email, password: emailAuth.password) { (authResult, error) in

                guard let user = authResult?.user, error != nil else {
                    if let error = error {
                        single(.error(error))
                    }
                    return
                }
                single(.success(user))
            }
            return Disposables.create()
        }
    }
}
