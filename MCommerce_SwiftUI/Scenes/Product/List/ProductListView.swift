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
    let viewModel: ProductListViewModel
    private let widthCell = (UIScreen.main.bounds.width - 50) / 2
    
    init(searchParams: ProductSearchParams) {
        viewModel = ProductListViewModel(searchParams: searchParams)
    }
    
    var body: some View {
        ZStack {
            Color(hex: "E5E5E5")
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        NavigationLink {
                            ProductDetailView()
                        } label: {
                            
                            
                            VStack(alignment: .leading, spacing: 0) {
                                image(product: product)
                                
                                Rectangle()
                                    .frame(width: widthCell, height: 0.5)
                                    .foregroundColor(Color(white: 0.9))
                                
                                description(product: product)
                                    .padding(.leading, 5)
                                    .padding(.bottom, 8)
                            }
                            .frame(width: widthCell)
                            .clipped()
                            
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
    
    func image(product: ProductModel) -> some View {
        ZStack(alignment: .topLeading) {
            KFImage(URL(string: "https://cea.vtexassets.com/arquivos/ids/55602173-1600-auto?v=637980639625170000&width=1600&height=auto&aspect=true"))
                .resizable()
                .scaledToFill()
                .frame(width: widthCell, height: 250)
                .clipped()
            
            Color.red
                .overlay {
                    Text("-15%")
                        .font(.custom(
                            "AmericanTypewriter",
                            fixedSize: 11))
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 20)
                .offset(x: 0, y: 20)
            
            Button {
                print("==> Favotite Button: \(product.id)")
            } label: {
                Image(systemName: "heart")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }
            .offset(x: 10, y: 210)
        }
    }
    
    func description(product: ProductModel) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Vestido pantacourt de viscose decote amarração bananeira off white")
                .font(.system(size: 16))
                .foregroundColor(.black)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text("R$ 64,99")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.blue)
            
            Text("Em até 2x no Cartão")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            
        }
        .padding(.top, 8)
        .background(.white)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(searchParams: ProductSearchParams(queryText: "", queryCollection: ""))
    }
}
