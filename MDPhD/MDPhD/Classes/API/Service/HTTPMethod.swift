//
//  HTTPMethod.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-24.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

public enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum HTTPConstValue: String {
    case applicationJson = "application/json"
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}
