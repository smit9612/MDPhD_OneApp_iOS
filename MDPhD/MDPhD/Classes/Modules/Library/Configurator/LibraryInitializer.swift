//
//  LibraryLibraryInitializer.swift
//  MDPhD
//
//  Created by Smitesh Patel on 06/08/2018.
//  Copyright © 2018 MIFISI. All rights reserved.
//

import UIKit

class LibraryModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var libraryViewController: LibraryViewController!

    override func awakeFromNib() {

        let configurator = LibraryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: libraryViewController)
    }

}
