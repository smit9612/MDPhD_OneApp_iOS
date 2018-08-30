//
//  SettingsSettingsPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class SettingsPresenter: SettingsModuleInput, SettingsViewOutput, SettingsInteractorOutput {

    weak var view: SettingsViewInput!
    var interactor: SettingsInteractorInput!
    var router: SettingsRouterInput!

    func viewIsReady() {

    }
}
