//
//  ShopBannerView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct ShopBannerView: View {
  
  struct Constants {
    
  }
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Rectangle()
          .foregroundColor(.clear)
          .background(Color(red: 0.89, green: 0.18, blue: 0.18))
          .cornerRadius(25)
          .clipped()
        VStack {
          ZStack {
            Image("artist_image")
              .resizable()
              .scaledToFit()
              .frame(width: proxy.size.width / 2, height: proxy.size.width / 2)
              .clipShape(Circle())
              .overlay(Circle().strokeBorder(.white, lineWidth: 6))
            Image("shop_album_playImage")
              .resizable()
              .scaledToFit()
              .frame(width: 40, height: 40)
              .offset(x: (proxy.size.width / 4) * UIMath.cos45,
                    y: UIMath.sin45 * (proxy.size.width / 4))
          }
          
          Text("Noche de\nBad Bunny")
            .font(.system(size: 32, weight: .bold))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            
          
          Text("Pre-order now on Weverse Shop!")
            .font(.system(size: 14, weight: .medium))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
          
        }
      }
    }
  }
}
  /*
  #Preview {
    ShopBannerView()
  }
*/
