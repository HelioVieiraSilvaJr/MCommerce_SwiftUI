//
//  URLSessionProtocol.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

public protocol URLSessionProtocol {
    func dataTask(with: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
