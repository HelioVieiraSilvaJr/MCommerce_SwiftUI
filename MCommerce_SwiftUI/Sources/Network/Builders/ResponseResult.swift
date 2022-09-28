//
//  ResponseResult.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

enum ResponseResult<Model> {
    case success(Model)
    case error(NetworkError)
}
