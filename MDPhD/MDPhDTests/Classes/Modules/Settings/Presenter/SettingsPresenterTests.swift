//
//  SettingsSettingsPresenterTests.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import XCTest

class SettingsPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: SettingsInteractorInput {

    }

    class MockRouter: SettingsRouterInput {

    }

    class MockViewController: SettingsViewInput {

        func setupInitialState() {

        }
    }
}
