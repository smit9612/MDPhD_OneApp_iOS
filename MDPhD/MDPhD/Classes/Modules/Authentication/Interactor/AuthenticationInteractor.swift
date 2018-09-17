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
        print("UserName: \(viewModel.userName.value ?? "")")
        print("Password: \(viewModel.password.value ?? "")")
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

    private func createUser() {
        guard let userEmail = viewModel.userName.value, let password = viewModel.password.value else {
            return
        }
        firebaseManager.createFirebaseNewUser(email: userEmail, password: password) { result in
            switch result {
            case .success:
                print("createUser successfull")
            case .failure(let error):
                print("Failure \(error.localizedDescription)")
            }
        }
    }

}
