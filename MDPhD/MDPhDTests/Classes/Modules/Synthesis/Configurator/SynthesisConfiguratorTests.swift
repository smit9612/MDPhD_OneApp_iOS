//
//  SynthesisSynthesisConfiguratorTests.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import XCTest

class SynthesisModuleConfiguratorTests: XCTestCase {

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
        let viewController = SynthesisViewControllerMock()
        let configurator = SynthesisModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "SynthesisViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SynthesisPresenter, "output is not SynthesisPresenter")

        let presenter: SynthesisPresenter = viewController.output as! SynthesisPresenter
        XCTAssertNotNil(presenter.view, "view in SynthesisPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SynthesisPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SynthesisRouter, "router is not SynthesisRouter")

        let interactor: SynthesisInteractor = presenter.interactor as! SynthesisInteractor
        XCTAssertNotNil(interactor.output, "output in SynthesisInteractor is nil after configuration")
    }

    class SynthesisViewControllerMock: SynthesisViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
