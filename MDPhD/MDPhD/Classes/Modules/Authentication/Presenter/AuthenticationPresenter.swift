//
//  AuthenticationAuthenticationPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import RxSwift
import RxCocoa

class AuthenticationPresenter: AuthenticationModuleInput, AuthenticationViewOutput, AuthenticationInteractorOutput {

    weak var view: AuthenticationViewInput!
    var interactor: AuthenticationInteractorInput!
    var router: AuthenticationRouterInput!

    let disposeBag = DisposeBag()

    func viewIsReady() {
        setupBindings()
    }

    private func setupBindings() {
        if let sourceView = view as? AuthenticationViewController {
            sourceView.userNameTextField.rx.text
                .asObservable()
                .map { text -> String? in
                    return Optional(text)!
                }
                .bind(to: interactor.viewModel.userName)
                .disposed(by: disposeBag)

            sourceView.passwordTextField.rx.text
                .asObservable().map {
                    text -> String? in
                    return Optional(text)!
                }
                .bind(to: interactor.viewModel.password)
                .disposed(by: disposeBag)
        }
    }

    func doLogin() {
        interactor.doLogin()
    }

}
