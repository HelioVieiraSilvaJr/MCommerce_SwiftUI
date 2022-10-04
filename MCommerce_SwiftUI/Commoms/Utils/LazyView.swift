//
//  LazyView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 04/10/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
