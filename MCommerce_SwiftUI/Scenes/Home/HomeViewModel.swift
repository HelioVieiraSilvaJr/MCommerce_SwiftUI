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
    
    init() {
        fetch()
    }
    
    func fetch() {
        print("==> Chamou os dados: HOME")
        service.fetch { homeModel in
            DispatchQueue.main.async {
                print("==> Chegou os dados: HOME")
                self.homeModel = homeModel                
            }
        } failure: { error in
            print("==> Error: \(error.localizedDescription)")
        }
    }
}
