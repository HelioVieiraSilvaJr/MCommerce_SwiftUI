//
//  WishlistView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 26/09/22.
//

import SwiftUI

struct WishlistView: View {
    
    let params: [String:Any]
    
    init(params: [String: Any]) {
        self.params = params
        print("==> Wishlist, Params: \(params)")
    }
    
    var body: some View {
        Text("Wishlist View | \(params.keys.first ?? "-?-")")
    }
}

//struct WishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        WishlistView()
//    }
//}
