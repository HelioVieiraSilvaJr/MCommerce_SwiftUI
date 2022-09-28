//
//  HTTPDecodeBuilder.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

struct HTTPDecodeBuilder {
    static func build<Model: Decodable>(from data: Data?,
                                        objectType: Model.Type?) throws -> Model {
        
        guard let objectType = objectType else { throw NetworkError.unknown }
        guard let data = data else { throw NetworkError.noData }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            let object = try decoder.decode(objectType, from: data)

            return object
        } catch {
            debugPrint(error)
            throw NetworkError.parseFailed
        }
    }

    static func buildToDictionary(from data: Data?) throws -> [String: Any]? {
        guard let data = data else { throw NetworkError.noData }

        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
            return json
        } catch {
            debugPrint(error)
            throw NetworkError.parseFailed
        }
    }
}
