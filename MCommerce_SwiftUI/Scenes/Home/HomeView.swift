//
//  HomeView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 26/09/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if let homeModel = viewModel.homeModel,
                       let sections = homeModel.masculine.sections {
                        LazyVStack {
                            ForEach(sections) { section in
                                switch section.type {
                                case .pageBigImage:
                                    PageBigImageView(section: section)
                                    
                                case .singleWideImage:
                                    SingleWideImageView(section: section)
                                    
                                default:
                                    Rectangle()
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                    
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
                                .frame(height: 42)
                        }
                    }
            }
            .onAppear {
                viewModel.fetch()
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
