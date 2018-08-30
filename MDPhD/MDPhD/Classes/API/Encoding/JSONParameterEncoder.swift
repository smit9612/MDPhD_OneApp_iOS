//
//  JSONParameterEncoder.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-24.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: HTTPHeaderField.contentType.rawValue) == nil {
                urlRequest.setValue(HTTPConstValue.applicationJson.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            }
        }
    }
}
