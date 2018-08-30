//
//  LibraryLibraryViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, LibraryViewInput {

    var output: LibraryViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LibraryViewInput
    func setupInitialState() {
    }
}
