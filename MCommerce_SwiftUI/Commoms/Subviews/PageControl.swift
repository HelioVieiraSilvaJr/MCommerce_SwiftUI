//
//  PageControl.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import SwiftUI

struct PageControl: View {
    
    
    @Binding var selectedPage: Int
    var pages: Int
    var circleDiameter: CGFloat
    var circleMargin: CGFloat
    var tintColor: Color = .black

    
    var body: some View {
        ZStack {
            // Total number of pages
            HStack(spacing: circleMargin) {
                ForEach(0 ..< pages) { index in
                    if index == selectedPage {
                        Circle()
                            .foregroundColor(tintColor)
                            .frame(width: circleDiameter, height: circleDiameter)
                    }
                    else {
                        Circle()
                            .foregroundColor(tintColor.opacity(0.25))
                            .frame(width: circleDiameter, height: circleDiameter)
                    }
                }
            }
        }
    }
}
