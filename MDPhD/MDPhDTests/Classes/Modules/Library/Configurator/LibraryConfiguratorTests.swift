//
//  LibraryLibraryConfiguratorTests.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import XCTest

class LibraryModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = LibraryViewControllerMock()
        let configurator = LibraryModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "LibraryViewController is nil after configuration")
        XCTAssertTrue(viewController.output is LibraryPresenter, "output is not LibraryPresenter")

        let presenter: LibraryPresenter = viewController.output as! LibraryPresenter
        XCTAssertNotNil(presenter.view, "view in LibraryPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in LibraryPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is LibraryRouter, "router is not LibraryRouter")

        let interactor: LibraryInteractor = presenter.interactor as! LibraryInteractor
        XCTAssertNotNil(interactor.output, "output in LibraryInteractor is nil after configuration")
    }

    class LibraryViewControllerMock: LibraryViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
