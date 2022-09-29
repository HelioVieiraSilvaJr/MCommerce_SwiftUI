//
//  SingleWideImageCell.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import SwiftUI
import Kingfisher

struct SingleWideImageCell: View {
    
    let section: HomeDepartmentModel.Section
    
    var body: some View {
        if let item = section.items.first {
            Button {
                print("==> Click, deeplink: \(item.deeplink)")
            } label: {
                KFImage(URL(string: item.image))
                    .resizable()
                    .scaledToFill()
                    .padding(.horizontal, 24)
                    .padding(.vertical, 20)
            }

        }
    }
}
