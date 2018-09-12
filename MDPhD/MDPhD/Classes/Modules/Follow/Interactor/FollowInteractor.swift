//
//  FollowFollowInteractor.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class FollowInteractor: FollowInteractorInput {

    weak var output: FollowInteractorOutput!

}


extension FollowInteractor: ManagerInjected {

    func getFolders() {
        firebaseManager.getFolders()
    }
}
