//
//  PageBigImageCell.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import SwiftUI
import Kingfisher

struct PageBigImageCell: View {
    
    let section: HomeDepartmentModel.Section
    @State private var pageSelected = 1
    
    var body: some View {
        VStack {
            TabView {
                let itemsCount = section.items.count
                ForEach(0 ..< itemsCount) { index in
                    if let item = section.items[index] {
                        
                        let object: [String: Any] = ["favoritesCount": 22, "keyStorage": "vinteDois"]
                        let deeplink = DeeplinkManager.getDestinationView(from: item.deeplink, object: object)
                        
                        NavigationLink {
                            deeplink.destination
                        } label: {
                            KFImage(URL(string: item.image))
                                .resizable()
                                .scaledToFill()
                                .onAppear {
                                    pageSelected = index
                                }
                        }
                        .disabled(deeplink.isDisabled)

                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 500)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            PageControl(selectedPage: $pageSelected,
                        pages: section.items.count,
                        circleDiameter: 8,
                        circleMargin: 12,
                        tintColor: .black)
            .padding(.top, 8)
            
            Spacer()
        }
    }
}

struct PageBigImageView_Previews: PreviewProvider {
    static var previews: some View {
        PageBigImageCell(section: HomeDepartmentModel.Section(type: .pageBigImage,
                                                              title: nil,
                                                              items: mockItems()))
    }
    
    static func mockItems() -> [HomeDepartmentModel.Item] {
        return [
            HomeDepartmentModel.Item(image: "https://images.cea-ecommerce.com.br/home/contents/2020_nova-estacao-v2-w16/iphone/dirXHDPI/nova-estacao-v2.png",
                                     text: "Ta bombando!",
                                     deeplink: "https://wa.me/551135852892")
        ]
    }
}
