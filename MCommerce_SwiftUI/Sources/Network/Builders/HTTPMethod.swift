//
//  HTTPMethod.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

public enum HTTPMethod: String, Equatable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
