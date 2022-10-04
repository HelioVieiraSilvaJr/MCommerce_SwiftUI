//
//  DeeplinkManager.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 04/10/22.
//

import Foundation
import SwiftUI

struct DeeplinkManager {
    
//    enum Destination: String {
//        case products       = "deeplink://products"
//        case product        = "deeplink://product"
//        case wishlist       = "deeplink://wishlist"
//        case unknown
//
//        init(from decoder: Decoder) throws {
//            let label = try decoder.singleValueContainer().decode(String.self)
//            self = Destination(rawValue: label) ?? .unknown
//        }
//    }
    
    enum Destination: Equatable {
        case products
        case product
        case wishlist([String:Any])
        case unknown
        
        static func == (lhs: DeeplinkManager.Destination, rhs: DeeplinkManager.Destination) -> Bool {
            lhs == rhs
        }
    }
    
//    @ViewBuilder static func getDestinationView(from deeplink: String, object: Any? = nil) -> some View {
//        let destination = getDestination(deeplink: deeplink)
//        switch destination {
//        case .products:
//            DepartmentView(selectedIndex: .constant(1))
//
//        case .product:
//            ProfileView(selectedIndex: .constant(4))
//
//        case .wishlist:
//            if let model = object as? HomeDepartmentModel.Item {
//                WishlistView(selectedIndex: .constant(2), model: model)
//            } else {
//                EmptyView()
//            }
//
//        default:
//            EmptyView()
//        }
//    }
    
//    @ViewBuilder
    static func getDestinationView(from deeplink: String, object: Any? = nil) -> (destination: AnyView, isDisabled: Bool) {
        let destination = getDestination(deeplink: deeplink)
        var view = AnyView(EmptyView())
        var isDisabled = false
        
        switch destination {
        case .products:
            view = AnyView(DepartmentView())

        case .product:
            view = AnyView(ProfileView())

        case .wishlist(let paramsQuery):
            var params = object as? [String: Any] ?? [:]
            params.merge(paramsQuery) { _, _ in }
            view = AnyView(WishlistView(params: params))

        default:
            isDisabled = true
        }
        
        return (view, isDisabled)
    }
    
    static func canDisable(deeplink: String, object: Any? = nil) -> Bool {
        getDestination(deeplink: deeplink) == .unknown
    }
    
    static func getDestination(deeplink: String) -> Destination {
        guard let components = URL(string: deeplink) else { return .unknown }
        print("==> Components: \(components)")
        
        if let scheme = components.scheme, scheme == "deeplink", let host = components.host {
            switch host {
            case "products":
                print("==> PRODUCTS")
                return .products
                
            case "product":
                print("==> PRODUCT")
                return .product
                
            case "wishlist":
                let params = components.queryDictionary
                
                print("==> WISHLIST | \(params)")
                return .wishlist(params ?? [:])
                
            default:
                print("==> DEFAULT")
            }
        }
        
        return .unknown
    }
    
    static func teste() {
        let name = NSNotification.Name(rawValue: "changeSelectedTab")
        NotificationCenter.default.post(name: name, object: nil)
    }
}
