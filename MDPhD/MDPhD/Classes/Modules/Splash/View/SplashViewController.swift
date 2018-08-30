//
//  SplashSplashViewController.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, SplashViewInput {

    var output: SplashViewOutput!
    var gameTimer: Timer!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        activityIndicator.startAnimating()
    }

    @objc
    func runTimedCode() {
        activityIndicator.stopAnimating()
        output.buttonTapped()
    }

    @IBAction func buttonClicked(_ sender: Any) {
        activityIndicator.stopAnimating()
        output.buttonTapped()
    }
    // MARK: SplashViewInput
    func setupInitialState() {
    }
}
