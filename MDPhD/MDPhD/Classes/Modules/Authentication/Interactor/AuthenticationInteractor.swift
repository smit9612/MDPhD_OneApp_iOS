//
//  AuthenticationAuthenticationInteractor.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

final class AuthenticationInteractor: AuthenticationInteractorInput {

    var viewModel: AuthFormViewModel!
    weak var output: AuthenticationInteractorOutput!

    func doLogin() {
        registerUser()
    }
}

extension AuthenticationInteractor: ManagerInjected {

    private func provideFeed() {
        networkManager.getFeed { result in
            switch result {
            case .success:
                print("API Success")
            case .failure:
                //TODO what next
                print("API failure")
            }
        }
    }

    private func registerUser() {
        guard let userEmail = viewModel.userName.value, let password = viewModel.password.value else {
            return
        }
        loginService.createAccount(with: EmailAuth(email:userEmail, password: password)).subscribe { event in
            switch event {
            case .success(let user):
                print(user.refreshToken ?? "")
            case .error(let error):
                print (error.localizedDescription)
            }
        }
    }
}
