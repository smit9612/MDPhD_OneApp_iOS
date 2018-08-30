//
//  SynthesisSynthesisViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SynthesisViewController: UIViewController, SynthesisViewInput {

    var output: SynthesisViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: SynthesisViewInput
    func setupInitialState() {
    }
}
