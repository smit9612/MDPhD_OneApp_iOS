//
//  Router.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-24.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {

    private var task: URLSessionTask?
    func request(_ route: EndPoint, completion: @escaping URLRequestionCompletion) {
        let session = URLSession.shared
        DispatchQueue.network.async {
            do {
                let request = try self.buildRequest(from: route)
                self.task = session.dataTask(with: request, completionHandler: { data, response, error in
                    // TODO handle response and Error scenario
                    if let urlResponse = response as? HTTPURLResponse {
                        if case .success = urlResponse.result {
                            completion(.success(data), urlResponse)
                        } else {
                            completion(urlResponse.result, nil)
                        }
                    }
                })
            } catch {
                completion(.failure(CoreServiceError.failed), nil)
            }
            self.task?.resume()
        }
    }

    func cancel() {
        self.task?.cancel()
    }
}

extension HTTPURLResponse {

    var result: Result<Data?> {
        switch self.statusCode {
        case 200...299: return .success(nil)
        case 401...500: return .failure(CoreServiceError.authenticationError)
        case 501...509: return .failure(CoreServiceError.badRequest)
        case 600: return .failure(CoreServiceError.outdated)
        default: return .failure(CoreServiceError.failed)
        }
    }
}

// MARK: - Router Private Methods
extension Router {

    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)

        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue(HTTPConstValue.applicationJson.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            case .requestParameters(let bodyParameters, let urlParameters):
                try configureParamters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionHeaders):
                addAdditionalHeaders(additionHeaders, request: &request)
                try configureParamters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
        }
        return request
    }

    fileprivate func configureParamters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }

    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
