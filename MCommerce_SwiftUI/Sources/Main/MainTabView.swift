//
//  MainTabView.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 26/09/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                DepartmentView()
                    .tabItem {
                        Image(systemName: "list.triangle")
                    }
                
                WishlistView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                CartView()
                    .tabItem {
                        Image(systemName: "cart")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
