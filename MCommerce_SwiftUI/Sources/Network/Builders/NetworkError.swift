//
//  NetworkError.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case noInternet
    case parseFailed
    case statusCode(_ statusCode: Int, _ object: Any)
    case unknown

    var localizedDescription: String {
        switch self {
        case .noData, .invalidURL, .unknown, .statusCode:
            return "Não conseguimos realizar a sua solicitação"
        case .parseFailed:
            return "Erro ao montar sua solicitação"
        case .noInternet:
            return "Estamos tendo problemas com a conexão."
        }
    }
}
