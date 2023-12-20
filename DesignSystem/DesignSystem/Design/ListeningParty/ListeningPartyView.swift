//
//  ListeningPartyView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct ListeningPartyView: View {
  struct Constants {
    static let red: Color = Color(red: 0.96,
                                  green: 0.32,
                                  blue: 0.31)
    static let headerRatio: CGFloat = 0.190
    static let thumbImageRatio: CGFloat = 0.50
    static let thumbSubimageRatio: CGFloat = 0.21
    static let bottomeInfoRatio: CGFloat = 0.310
    static let gray: Color = Color(red: 0.56, green: 0.56, blue: 0.56)
  }
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        VStack(spacing: 0) {
          topHeader
            .frame(width: proxy.size.width, height: proxy.size.height * Constants.headerRatio)
          
          ZStack {
            Image("lp_artist")
              .resizable()
              .scaledToFill()
              .frame(width: proxy.size.width, height: proxy.size.height * Constants.thumbImageRatio)
              .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
              Spacer()
              HStack(spacing: 0) {
                Image("lp_artist")
                  .resizable()
                  .scaledToFill()
                  .frame(width: proxy.size.height * Constants.thumbImageRatio * Constants.thumbSubimageRatio,
                         height: proxy.size.height * Constants.thumbImageRatio * Constants.thumbSubimageRatio)
                  .clipped()
                VStack(alignment: .leading) {
                  HStack {
                    Text("UNFORGIVEN (feat. Nile Rodgers)")
                      .font(.system(size: 13, weight: .semibold))
                      .foregroundColor(.white)
                  }
                  Text("LE SSERAFIM")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.5))
                }
                .padding(.horizontal, 13)
              }
              .frame(height: proxy.size.height * Constants.thumbImageRatio * Constants.thumbSubimageRatio)
              .background(.thinMaterial)
              .clipShape(RoundedRectangle(cornerRadius: 6))
              Spacer()
                .frame(height: 16)
            }
            
            
            
          }
          
          VStack(spacing: 13) {
            Spacer()
            VStack(spacing: 3) {
              Text("122,430,749")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
              Text("Streams of 136M goal")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Constants.gray)
            }
            slider
            Spacer()
          }
          .frame(width: proxy.size.width,
                 height: proxy.size.height * Constants.bottomeInfoRatio)
        }
      }
    }
    .background(.white)
  }
  
  var topHeader: some View {
    HStack {
      Text("Listening Party")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.black)
      onAirBadge
        .frame(width: 70, height: 20)
      Spacer()
    }
    .padding(.horizontal, 25)
  }
  
  var onAirBadge: some View {
    GeometryReader { proxy in
      HStack(alignment: .center, spacing: 4) {
        Image("lp_onair")
          .resizable()
          .scaledToFit()
          .frame(height: proxy.size.height * 9 / 14)
        Text("ON AIR")
          .font(.system(size: 12, weight: .bold))
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Constants.red)
      .clipShape(RoundedRectangle(cornerRadius: proxy.size.height / 2))
      
    }
  }
  
  var slider: some View {
    StaticSlider()
  }
}

#Preview {
    ListeningPartyView()
}
