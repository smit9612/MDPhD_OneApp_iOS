//
//  FollowFollowViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class FollowViewController: UIViewController, FollowViewInput {

    var output: FollowViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: FollowViewInput
    func setupInitialState() {
    }
}
