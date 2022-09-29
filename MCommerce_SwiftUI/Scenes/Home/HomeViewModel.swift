//
//  HomeViewModel.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    private let service = HomeService()
    @Published var homeModel: HomeModel?
    
    func fetch() {
        service.fetch { homeModel in
            print("==> Success: \(homeModel)")
            self.homeModel = homeModel
        } failure: { error in
            print("==> Error: \(error.localizedDescription)")
        }
    }
}
