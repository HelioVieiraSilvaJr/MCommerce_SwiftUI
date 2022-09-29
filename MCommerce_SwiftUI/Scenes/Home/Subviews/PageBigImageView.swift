//
//  PageBigImageView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 28/09/22.
//

import SwiftUI
import Kingfisher

struct PageBigImageView: View {
    let section: HomeDepartmentModel.Section
    @State private var pageSelected = 1
    
    var body: some View {
        VStack {
            TabView {
                ForEach(0 ..< section.items.count) { index in
                    if let item = section.items[index] {
                        KFImage(URL(string: item.image))
                            .resizable()
                            .scaledToFill()
                            .onAppear {
                                pageSelected = index
                            }
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
        PageBigImageView(section: HomeDepartmentModel.Section(type: .pageBigImage,
                                                              items: mockItems()))
    }
    
    static func mockItems() -> [HomeDepartmentModel.Item] {
        return [
            HomeDepartmentModel.Item(image: "https://images.cea-ecommerce.com.br/home/contents/2020_nova-estacao-v2-w16/iphone/dirXHDPI/nova-estacao-v2.png",
                                     deeplink: "https://wa.me/551135852892")
        ]
    }
}
