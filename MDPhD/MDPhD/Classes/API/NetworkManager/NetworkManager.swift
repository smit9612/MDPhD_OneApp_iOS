//
//  API.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-24.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
public typealias NetworkAPICompletion = (Result<Bool>) -> Void
public enum Result<T> {

    case success(T)
    case failure(CoreServiceError)
}

public enum CoreServiceError {

    case networkError
    case authenticationError
    case badRequest
    case failed
    case outdated
    case noData
    case unableToDecode
}

typealias AuthToken = String

protocol NetworkManagerProtocol {
    func getFeed(complete: @escaping NetworkAPICompletion)
}

struct NetworkManager: NetworkManagerProtocol {

    static let envirorment: NetworkEnviroment = .production
    private var authToken: AuthToken = ""
    private let router = Router<MDPhDApi>()

}

extension NetworkManager {

    public func getFeed(complete: @escaping NetworkAPICompletion) {
        DispatchQueue.homeFeedManager.async {
            self.router.request(.idSearch, completion: { result, urlResponse in
                switch result {
                // Handle API specific response
                case .success:
                    complete(.success(true))
                case .failure(let error):
                    complete(.failure(error))
                }
            })
        }
    }
}

extension DispatchQueue {
    static let network = DispatchQueue(label: "com.mdphd.network")
    static let homeFeedManager = DispatchQueue(label: "com.mdphd.homeFeed", attributes: .concurrent, target: .network)
}

