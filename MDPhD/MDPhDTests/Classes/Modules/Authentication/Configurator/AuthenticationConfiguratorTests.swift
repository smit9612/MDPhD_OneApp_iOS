//
//  AuthenticationAuthenticationConfiguratorTests.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import XCTest

class AuthenticationModuleConfiguratorTests: XCTestCase {

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
        let viewController = AuthenticationViewControllerMock()
        let configurator = AuthenticationModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AuthenticationViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AuthenticationPresenter, "output is not AuthenticationPresenter")

        let presenter: AuthenticationPresenter = viewController.output as! AuthenticationPresenter
        XCTAssertNotNil(presenter.view, "view in AuthenticationPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AuthenticationPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AuthenticationRouter, "router is not AuthenticationRouter")

        let interactor: AuthenticationInteractor = presenter.interactor as! AuthenticationInteractor
        XCTAssertNotNil(interactor.output, "output in AuthenticationInteractor is nil after configuration")
    }

    class AuthenticationViewControllerMock: AuthenticationViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
