//
//  FollowFollowInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class FollowModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var followViewController: FollowViewController!

    override func awakeFromNib() {

        let configurator = FollowModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: followViewController)
    }

}
