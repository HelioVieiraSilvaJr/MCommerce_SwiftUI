//
//  ListSmallImageView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import SwiftUI
import Kingfisher

struct ListSmallImageView: View {
    let section: HomeDepartmentModel.Section
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.title ?? "")
                .foregroundColor(.black)
                .font(.title2)
                .padding(.bottom, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(section.items) { item in
                        VStack {
                            KFImage(URL(string: item.image))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 140)
                                .clipped()
                            
                            Text(item.text ?? "")
                                .foregroundColor(.black)
                                .font(.caption)
                                .lineLimit(2)
                                .frame(width: 100)
                        }
                    }
                }
            }
        }
        .padding(.leading, 24)
        .padding(.bottom, 12)
    }
}

struct ListSmallImageView_Previews: PreviewProvider {
    static var previews: some View {
        ListSmallImageView(section: HomeDepartmentModel.Section(type: .listSmallImage,
                                                                title: "Ta bombando!",
                                                                items: mockItems()))
    }
    
    static func mockItems() -> [HomeDepartmentModel.Item] {
        return [
            HomeDepartmentModel.Item(image: "https://cea.vtexassets.com/arquivos/ids/55710681-1600-auto?v=637991877701770000&width=1600&height=auto&aspect=true",
                                     text: "Alfaiataria colorida",
                                     deeplink: "https://wa.me/551135852892"),
            HomeDepartmentModel.Item(image: "https://cea.vtexassets.com/arquivos/ids/34503426-800-auto?v=637671501323800000&width=800&height=auto&aspect=true",
                                     text: "Top estampado",
                                     deeplink: "https://wa.me/551135852892")
        ]
    }
}
