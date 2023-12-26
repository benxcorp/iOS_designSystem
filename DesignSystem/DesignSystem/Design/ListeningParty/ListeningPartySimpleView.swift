//
//  ListeningPartySimpleView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/26.
//

import SwiftUI

struct ListeningPartySimpleView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      topHeader
      HStack(spacing: 12) {
        albumImageView
        VStack(alignment: .leading, spacing: 8) {
          Text("Las que no iban a salir")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
          listenerInfo
            .frame(height: 18)
        }
      }
    }
    .padding(.horizontal, 24)
    .padding(.top, 20)
    .padding(.bottom, 24)
    .background(
      LinearGradient(
        stops: [
          Gradient.Stop(color: Color(red: 0.07, green: 0.58, blue: 0.84), location: 0.39),
          Gradient.Stop(color: Color(red: 0.3, green: 0.5, blue: 1), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0, y: 0),
        endPoint: UnitPoint(x: 1, y: 1)
      )
    )
    .cornerRadius(20)
  }
  
  var topHeader: some View {
    HStack {
      Text("Listening Party")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.white)
      Spacer()
      onAirBadge
        .frame(width: 70, height: 20)
      
    }
  }
  
  var onAirBadge: some View {
    GeometryReader { proxy in
      HStack(alignment: .center, spacing: 4) {
        Image("lp_onair_red")
          .resizable()
          .scaledToFit()
          .frame(height: proxy.size.height * 9 / 14)
        
        Text("ON AIR")
          .font(.system(size: 12, weight: .bold))
          .multilineTextAlignment(.center)
          .foregroundColor(Colors.colorLightRed600)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.black)
      .clipShape(RoundedRectangle(cornerRadius: proxy.size.height / 2))
      
    }
  }
  
  var albumImageView: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 14)
        .frame(width: 78, height: 78)
        .foregroundColor(.white)
        .opacity(0.2)
      RoundedRectangle(cornerRadius: 14)
        .frame(width: 68, height: 68)
        .foregroundColor(.white)
        .opacity(0.3)
      Image("lp_sm_img")
        .resizable()
        .scaledToFill()
        .frame(width: 58, height: 58)
        .overlay(RoundedRectangle(cornerRadius: 14 ).strokeBorder(.white, lineWidth: 2))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
  }
  
  var listenerInfo: some View {
    HStack(spacing: 8) {
      ImageStackingView(urls: ["c1_bunny",
                               "c2_bts",
                               "c3_wkd"], 
                        height: 18)
      .frame(height: 18)
      
      Text("1.14K listeners")
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(.white.opacity(0.6))
        .lineLimit(1)
        
      
      Spacer()
        
        
    }
  }
}

#Preview {
  ListeningPartySimpleView()
}
