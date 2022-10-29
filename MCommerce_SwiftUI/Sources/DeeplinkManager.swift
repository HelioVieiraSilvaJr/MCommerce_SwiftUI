//
//  DeeplinkManager.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 04/10/22.
//

import Foundation
import SwiftUI

struct DeeplinkManager {
    
    enum Destination: Equatable {
        case products
        case product
        case wishlist([String:Any])
        case unknown
        
        static func == (lhs: DeeplinkManager.Destination, rhs: DeeplinkManager.Destination) -> Bool {
            return lhs == rhs
        }
    }
    
    static func getDestinationView(from deeplink: String, object: Any? = nil) -> (destination: AnyView, isDisabled: Bool) {
        let destination = getDestination(deeplink: deeplink)
        var view = AnyView(EmptyView())
        var isDisabled = false
        
        switch destination {
        case .products:
            let testSearch = ProductSearchParams(text: "blusa", collection: nil)
            view = AnyView(LazyView(ProductListView(searchParams: testSearch)))

        case .product:
            view = AnyView(LazyView(ProfileView()))

        case .wishlist(let paramsQuery):
            var params = object as? [String: Any] ?? [:]
            params.merge(paramsQuery) { _, _ in }
            view = AnyView(LazyView(WishlistView(params: params)))

        default: isDisabled = true
        }
        
        return (view, isDisabled)
    }
    
    static func getDestination(deeplink: String) -> DeeplinkManager.Destination {
        guard let components = URL(string: deeplink) else { return .unknown }
        print("==> Components: \(components)")
        
        if let scheme = components.scheme, scheme == "deeplink", let host = components.host {
            switch host {
            case "products":
                return .products
                
            case "product":
                return .product
                
            case "wishlist":
                let params = components.queryDictionary
                return .wishlist(params ?? [:])
                
            default: return .unknown
            }
        }
        return .unknown
    }
}
