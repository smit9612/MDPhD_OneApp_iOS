//
//  MDPhDApi.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

enum NetworkEnviroment {
    case qa
    case production
    case staging
}


enum APIFormat: String {

    case json
    case xml
}

enum APIAuthMethod: String {

    case firebase = "fb"
    case basic
}

public enum MDPhDApi {

    case search
    case cluster
    case facetCount
    case idSearch(params: Parameters, headers: HTTPHeaders)
    case suggest
    case facetMap
    case morelikeThis
}

extension MDPhDApi: EndPointType {

    var baseURL: URL {
        guard let url = URL(string: envBaseURL) else { fatalError("baseURL could not be configured") }
        return url
    }

    private var envBaseURL: String {
        return "https://api.mdphd.ca:7915/v3.4/\(APIFormat.json.rawValue)/\(APIAuthMethod.firebase.rawValue)/"
    }

    var path: String {
        return ""
    }

    var httpMethod: HTTPMethod {
        return .post
    }

    var task: HTTPTask {
        switch self {
        case .idSearch (let params, let httpHeaders):
            return .requestParametersAndHeaders(bodyParameters: params, ulrParameters: nil, additionHeaders: httpHeaders)
        default:
            return .request
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
