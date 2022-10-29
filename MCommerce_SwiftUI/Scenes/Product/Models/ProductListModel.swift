//
//  ProductListModel.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 16/10/22.
//

import Foundation

struct ProductListModel: Decodable {
    let count: Int
    let products: [Product]
    
    struct Product: Decodable {
        let sku: String
        let image: String?
        let title: String?
        let price: String?
        let priceDescription: String?
        let priceValue: Double?
        let discount: String?
    }
}
