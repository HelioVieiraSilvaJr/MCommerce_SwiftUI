//
//  HeaderBuilder.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

enum HeaderBuilder {
    case basic

    func build(_ customHeaders: [String: String]? = nil) -> [String: String] {
        switch self {
        case .basic:
            return basicHeader(with: customHeaders)
        }
    }

    private func basicHeader(with customHeaders: [String: String]? = nil) -> [String: String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        headers["versionApp"] = "1.0.1"
        headers["buildApp"] = "2"
        return headers
    }
}
