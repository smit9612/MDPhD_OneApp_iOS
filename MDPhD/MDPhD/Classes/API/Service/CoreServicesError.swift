//
//  CoreServicesError.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-09-17.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

public enum CoreServiceError {

    case networkError
    case authenticationError
    case badRequest
    case failed
    case outdated
    case noData
    case unableToDecode
    case userAlreadyRegistered
    case firebaseError

    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Network Error"
        default:
            return "Error Not define"
        }
    }
}
