//
//  SynthesisSynthesisInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class SynthesisModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var synthesisViewController: SynthesisViewController!

    override func awakeFromNib() {

        let configurator = SynthesisModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: synthesisViewController)
    }

}
