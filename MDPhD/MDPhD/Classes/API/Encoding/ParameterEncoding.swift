//
//  ParameterEncoding.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-24.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

protocol ParameterEncoder {

    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
