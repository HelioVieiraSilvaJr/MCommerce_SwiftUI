//
//  HomeView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 26/09/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Spacer()
                }.padding(.top)
                
                
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Button {
                                    print("==> Menu...")
                                } label: {
                                    Image(systemName: "line.3.horizontal")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        ToolbarItem(placement: .principal) {
                            Image("logo-helio")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.black)
                                .scaledToFit()
                                .frame(height: 44)
                        }
                    }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
