//
//  ProductListView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 16/10/22.
//

import SwiftUI
import Kingfisher

struct ProductListView: View {
    
    let columns = [GridItem(), GridItem()]
    @ObservedObject var viewModel: ProductListViewModel
    private let widthCell = (UIScreen.main.bounds.width - 50) / 2
    
    init(searchParams: ProductSearchParams) {
        viewModel = ProductListViewModel(searchParams: searchParams)
    }
    
    var body: some View {
        ZStack {
            Color(hex: "E5E5E5")
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products, id: \.self.sku) { product in
                        NavigationLink {
                            ProductDetailView()
                        } label: {
                            ProductListCard(product: product)
                        }
                    }
                    .background(.white)
                    .cornerRadius(4)
                }
                .padding(20)
            }
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(searchParams: ProductSearchParams(text: "", collection: ""))
    }
}
