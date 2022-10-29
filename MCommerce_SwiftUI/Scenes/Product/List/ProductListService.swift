//
//  ProductListService.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 29/10/22.
//

import Foundation

struct ProductListService {
    
    func fetchProductsWith(text: String, success: @escaping (ProductListModel) -> Void, failure: @escaping (Error) -> Void) {
        let params: [String:Any] = [
            "text": text
        ]
        
        Network().request(method: .get,
                          path: "/products",
                          model: ProductListModel.self,
                          params: params,
                          headers: nil) { response in
            switch response {
            case .success(let model):
                guard let model = model else { return }
                success(model)
            case .error(let error):
                failure(error)
            }
        }
    }
}
