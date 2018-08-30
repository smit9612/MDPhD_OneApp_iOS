//
//  RootRootConfiguratorTests.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import XCTest

class RootModuleConfiguratorTests: XCTestCase {

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
        let viewController = RootViewControllerMock()
        let configurator = RootModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "RootViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RootPresenter, "output is not RootPresenter")

        let presenter: RootPresenter = viewController.output as! RootPresenter
        XCTAssertNotNil(presenter.view, "view in RootPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RootPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RootRouter, "router is not RootRouter")

        let interactor: RootInteractor = presenter.interactor as! RootInteractor
        XCTAssertNotNil(interactor.output, "output in RootInteractor is nil after configuration")
    }

    class RootViewControllerMock: RootViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
