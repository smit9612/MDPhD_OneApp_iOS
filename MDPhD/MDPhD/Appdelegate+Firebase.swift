//
//  Appdelegate+Firebase.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-23.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import FirebaseCore

extension AppDelegate {

    func initializeFirebase() {
        // Check what is your current flow selected is It institution or local
         FirebaseApp.configure()
    }
    // TODO firebase remote config    
}
