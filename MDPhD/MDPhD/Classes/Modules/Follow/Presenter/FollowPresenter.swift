//
//  FollowFollowPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class FollowPresenter: FollowModuleInput, FollowViewOutput, FollowInteractorOutput {

    weak var view: FollowViewInput!
    var interactor: FollowInteractorInput!
    var router: FollowRouterInput!

    func viewIsReady() {

    }
}
