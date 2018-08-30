//
//  FollowFollowConfiguratorTests.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import XCTest

class FollowModuleConfiguratorTests: XCTestCase {

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
        let viewController = FollowViewControllerMock()
        let configurator = FollowModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "FollowViewController is nil after configuration")
        XCTAssertTrue(viewController.output is FollowPresenter, "output is not FollowPresenter")

        let presenter: FollowPresenter = viewController.output as! FollowPresenter
        XCTAssertNotNil(presenter.view, "view in FollowPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in FollowPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is FollowRouter, "router is not FollowRouter")

        let interactor: FollowInteractor = presenter.interactor as! FollowInteractor
        XCTAssertNotNil(interactor.output, "output in FollowInteractor is nil after configuration")
    }

    class FollowViewControllerMock: FollowViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
