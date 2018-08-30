//
//  SynthesisSynthesisPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class SynthesisPresenter: SynthesisModuleInput, SynthesisViewOutput, SynthesisInteractorOutput {

    weak var view: SynthesisViewInput!
    var interactor: SynthesisInteractorInput!
    var router: SynthesisRouterInput!

    func viewIsReady() {

    }
}
