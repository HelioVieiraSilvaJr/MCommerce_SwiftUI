//
//  HomeDepartmentModel.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import Foundation

struct HomeDepartmentModel: Decodable {
    let name: String
    let sections: [Section]?
    
    enum CellType: String, Codable {
        case pageBigImage
        case singleWideImage
        case listSmallImage
        case categories
        case listWideImage
        case listServices
        case none
        
        init(from decoder: Decoder) throws {
            let label = try decoder.singleValueContainer().decode(String.self)
            self = CellType(rawValue: label) ?? .none
          }
    }
    
    struct Section: Identifiable, Decodable {
        let id = UUID()
        let type: CellType
        let items: [Item]
    }
    
    struct Item: Identifiable, Decodable {
        let id = UUID()
        let image: String
        let deeplink: String
    }
}
