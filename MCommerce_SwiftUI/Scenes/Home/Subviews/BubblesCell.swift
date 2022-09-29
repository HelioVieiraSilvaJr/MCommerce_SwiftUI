//
//  BubblesCell.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 29/09/22.
//

import SwiftUI
import Kingfisher

struct BubblesCell: View {
    
    let section: HomeDepartmentModel.Section
    private let width: CGFloat = 70
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.title ?? "")
                .foregroundColor(.black)
                .font(.title3)
                .padding(.bottom, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(section.items) { item in
                        Button {
                            print("==> Click: \(item.text ?? "?")")
                        } label: {
                            VStack(alignment: .leading) {
                                KFImage(URL(string: item.image))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width, height: width)
                                    .clipShape(Circle())
                                    .clipped()
                                    .overlay(
                                        Circle()
                                            .stroke(.black, lineWidth: 1)
                                    ).padding(.top, 2)
                                
                                Text(item.text ?? "")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .frame(width: width)
                            }
                        }

                    }
                }
            }
        }
        .padding(.leading, 16)
        .padding(.bottom, 12)
    }
}
