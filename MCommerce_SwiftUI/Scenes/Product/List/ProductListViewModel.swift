//
//  ProductListViewModel.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 16/10/22.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    
    private let searchParams: ProductSearchParams
    @Published var products: [ProductModel] = []
    
    init(searchParams: ProductSearchParams) {
        self.searchParams = searchParams
        fetchProducts()
    }
    
    func fetchProducts() {
        let testProducts = [1,2,3,4,5].map({ _ in ProductModel(imageLink: "") })
        
        products = testProducts
    }
}
