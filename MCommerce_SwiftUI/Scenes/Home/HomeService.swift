//
//  HomeService.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

struct HomeService {
    
    func fetch(success: @escaping (HomeModel) -> Void, failure: @escaping (Error) -> Void) {
        Network().request(method: .get, path: "/home", model: HomeModel.self, params: nil, headers: nil) { response in
            switch response {
            case .success(let model):
                guard let homeModel = model else { return }
                success(homeModel)
            case .error(let error):
                failure(error)
            }
        }
    }
}
