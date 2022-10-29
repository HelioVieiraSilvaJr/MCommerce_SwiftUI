//
//  ProductListViewModel.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 16/10/22.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    
    private let searchParams: ProductSearchParams
    @Published var productsCount: Int = 0
    @Published var products: [ProductListModel.Product] = []
    private let service: ProductListService
    
    init(searchParams: ProductSearchParams, service: ProductListService = ProductListService()) {
        self.searchParams = searchParams
        self.service = service
        if let searchText = searchParams.text {
            fetchProductsWith(text: searchText)
        }
    }
    
    func fetchProductsWith(text: String) {
        service.fetchProductsWith(text: text) { model in
            DispatchQueue.main.async {
                self.productsCount = model.count
                self.products = model.products
            }
        } failure: { error in
            print("==> Error: \(error.localizedDescription)")
        }
    }
}
