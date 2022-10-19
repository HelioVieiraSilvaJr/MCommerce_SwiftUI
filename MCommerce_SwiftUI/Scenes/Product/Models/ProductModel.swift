//
//  Product.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 16/10/22.
//

import Foundation

struct ProductModel: Identifiable, Decodable {
    let id = UUID()
    let imageLink: String
}
