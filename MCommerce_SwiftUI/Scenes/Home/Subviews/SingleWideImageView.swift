//
//  SingleWideImageView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import SwiftUI
import Kingfisher

struct SingleWideImageView: View {
    
    let section: HomeDepartmentModel.Section
    
    var body: some View {
        if let item = section.items.first {
            KFImage(URL(string: item.image))
                .resizable()
                .scaledToFill()
                .padding()
        }
    }
}
