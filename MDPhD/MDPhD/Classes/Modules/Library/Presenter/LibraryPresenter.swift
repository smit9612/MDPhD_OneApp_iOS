//
//  LibraryLibraryPresenter.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

class LibraryPresenter: LibraryModuleInput, LibraryViewOutput, LibraryInteractorOutput {

    weak var view: LibraryViewInput!
    var interactor: LibraryInteractorInput!
    var router: LibraryRouterInput!

    func viewIsReady() {

    }
}
