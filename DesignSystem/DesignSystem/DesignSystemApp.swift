//
//  DesignSystemApp.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/18.
//

import SwiftUI

@main
struct DesignSystemApp: App {
    var body: some Scene {
        WindowGroup {
          TabView {
            
            HomeView()
              .tabItem {
                VStack {
                  Image("home_tab_img")
                  Text("Home")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Colors.textDefault)
                }
              }
            
            ShopMainView()
              .tabItem {
                VStack {
                  Image("shop_tab_img")
                  Text("Shop")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Colors.textDefault)
                }
                
              }
            DiscoverMainView()
              .tabItem {
                VStack {
                  Image("discover_tab_img")
                  Text("Discover")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Colors.textDefault)
                }
              }
            DmMainView()
              .tabItem {
                VStack {
                  Image("dm_tab_img")
                  Text("DM")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Colors.textDefault)
                }
              }
            MoreMainView()
              .tabItem {
                VStack {
                  Image("more_tab_img")
                  Text("More")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Colors.textDefault)
                }
              }
          
          }
          .accentColor(.black)
        }
    }
}
