//
//  CategoriesCell.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 29/09/22.
//

import SwiftUI
import Kingfisher

struct CategoriesCell: View {
    
    let section: HomeDepartmentModel.Section
    private let columns = [GridItem(), GridItem(), GridItem()]
    private let width = (UIScreen.main.bounds.width - 70) / 3
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(section.title ?? "")
                    .foregroundColor(.black)
                    .font(.title3)
                
                Spacer()
                
                Button {
                    print("==> Click: Mostrar todos")
                } label: {
                    Text("Mostrar todos")
                }

            }
            .padding(.bottom, 16)
            
            LazyVGrid(columns: columns) {
                ForEach(section.items) { item in
                    Button {
                        print("==> Click: \(item.text ?? "")")
                    } label: {
                        ZStack {
                            Color.gray.opacity(0.3)
                            
                            VStack(alignment: .center) {
                                KFImage(URL(string: item.image))
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 8)
                                
                                Text(item.text ?? "")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                            }
                            .frame(width: width, height: width * 1.1)
                        }
                        .cornerRadius(10)
                        .clipped()
                    }

                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 12)
    }
}

struct CategoriesCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCell(section: HomeDepartmentModel.Section(type: .listSmallImage,
                                                            title: "Navegue por categorias",
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
