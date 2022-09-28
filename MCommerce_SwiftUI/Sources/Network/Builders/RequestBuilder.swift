//
//  RequestBuilder.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

enum RequestBuilder {
    static func buildFrom(method: HTTPMethod,
                          path: String,
                          params: [String:Any]?,
                          customHeaders: [String:String]?,
                          scheme: String,
                          host: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path

        if let paramsUnwrapped = params, let params = paramsUnwrapped as? [String: String], method == .get {
            components.queryItems = params.map({ key, value in
                return URLQueryItem(name: key, value: value)
            })
        }

        guard let url = components.url else {
            debugPrint("Could not build URL request")
            return nil
        }
        
        var headers = HeaderBuilder.basic.build()
        if let customHeaders = customHeaders {
            headers.merge(customHeaders) { current, _ in
                current
            }            
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        if let params = params, method == .post || method == .patch || method == .put {
            
            let encoder = try! JSONSerialization.data(withJSONObject: params as Any, options: .prettyPrinted)
            request.httpBody = encoder
        }

        return request
    }
}
