//
//  ListWideImageCell.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 29/09/22.
//

import SwiftUI
import Kingfisher

struct ListWideImageCell: View {
    
    let section: HomeDepartmentModel.Section
    private let width = UIScreen.main.bounds.width - 60
    
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
                                    .scaledToFill()
                                    .frame(width: width, height: width * 1.4)
                                    .cornerRadius(10)
                                    .clipped()
                                
                                Text(item.title ?? "")
                                    .foregroundColor(.black)
                                    .font(.body)
                                
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
