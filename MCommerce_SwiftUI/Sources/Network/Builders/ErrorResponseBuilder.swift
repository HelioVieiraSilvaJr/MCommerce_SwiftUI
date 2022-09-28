//
//  ErrorResponseBuilder.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

struct ErrorResponseBuilder {
    static func build(from response: HTTPURLResponse, error: Error?, data: Data? = nil) throws {
        guard error == nil else {
            throw NetworkError.unknown
        }

        if 200...299 ~= response.statusCode && error == nil {
            return
        }

        let errorObject = try? HTTPDecodeBuilder.buildToDictionary(from: data)
        throw NetworkError.statusCode(response.statusCode, errorObject as Any)
    }
}
