//
//  HTTPProtocol.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

protocol HTTPProtocol {
    func request<Model: Decodable>(method: HTTPMethod,
                                   path: String,
                                   model: Model.Type?,
                                   params: [String:Any]?,
                                   headers: [String:String]?,
                                   scheme: String,
                                   completion: @escaping (ResponseResult<Model?>) -> Void)
    func cancel(completion: (() -> Void)?)
}

