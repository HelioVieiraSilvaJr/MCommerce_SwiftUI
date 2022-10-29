//
//  ProductListCard.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 29/10/22.
//

import SwiftUI
import Kingfisher

struct ProductListCard: View {
    
    private let widthCell = (UIScreen.main.bounds.width - 50) / 2
    let product: ProductListModel.Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image()
            
            Rectangle()
                .frame(width: widthCell, height: 0.5)
                .foregroundColor(Color(white: 0.9))
            
            description()
                .padding(.leading, 5)
                .padding(.bottom, 8)
        }
        .frame(width: widthCell)
        .clipped()
    }
    
    func image() -> some View {
        ZStack(alignment: .topLeading) {
            KFImage(URL(string: product.image ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: widthCell, height: 250)
                .clipped()
            
            
            if let discount = product.discount {
                Color.red
                    .overlay {
                        Text(discount)
                            .font(.custom(
                                "AmericanTypewriter",
                                fixedSize: 11))
                            .foregroundColor(.white)
                    }
                    .frame(width: 40, height: 20)
                    .offset(x: 0, y: 20)
            }
            
            Button {
                print("==> Favotite Button: \(product.sku)")
            } label: {
                Image(systemName: "heart")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }
            .offset(x: 10, y: 210)
        }
    }
    
    func description() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(product.title ?? "-")
                .font(.system(size: 16))
                .foregroundColor(.black)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text(product.price ?? "-")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.blue)
            
            Text(product.priceDescription ?? "-")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            
        }
        .padding(.top, 8)
        .background(.white)
    }
}

struct ProductListCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCard(product: ProductListModel.Product(sku: "",
                                                          image: "",
                                                          title: "",
                                                          price: "",
                                                          priceDescription: "",
                                                          priceValue: 0.0,
                                                          discount: ""))
    }
}
