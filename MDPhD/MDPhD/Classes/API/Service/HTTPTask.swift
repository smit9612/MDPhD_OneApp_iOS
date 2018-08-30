//
//  HTTPTask.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-24.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
public typealias HTTPHeaders = [String:String]

public enum HTTPTask {

    case request

    case requestParameters(bodyParameters: Parameters?, ulrParameters: Parameters?)

    case requestParametersAndHeaders(bodyParameters: Parameters?, ulrParameters: Parameters?, additionHeaders: HTTPHeaders?)

}
