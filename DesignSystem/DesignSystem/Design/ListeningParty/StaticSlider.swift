//
//  StaticSlider.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct StaticSlider: View {
  struct Constants {
    static let sliderLineWidthRatio: CGFloat = 4 / 28
    static let thumbSizeRatio: CGFloat = 18 / 28
  }
  @State var currentPosition: CGFloat = 0
  @State var maxValue: CGFloat = 1
  
  var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .leading) {
        Colors.ColorRolesPrimaryMint
          .frame(width: proxy.size.width - proxy.size.height, height: proxy.size.height * Constants.sliderLineWidthRatio)
          .clipShape(RoundedRectangle(cornerRadius: 4))
          .offset(x: proxy.size.height / 2)
          
        thumb(size: proxy.size)
      }
      .frame(maxHeight: .infinity)
    }
  }
  
  @ViewBuilder
  func thumb(size: CGSize) -> some View {
    ZStack {
      Circle()
        .foregroundColor(Colors.ColorRolesPrimaryMint)
        .opacity(0.2)
      
      Circle()
        .frame(width: size.height * Constants.thumbSizeRatio,
               height: size.height * Constants.thumbSizeRatio)
        .foregroundColor(Colors.ColorRolesPrimaryMint)
        .opacity(0.4)
      
      Circle()
        .frame(width: size.height * Constants.thumbSizeRatio * 0.5,
               height: size.height * Constants.thumbSizeRatio * 0.5)
        .foregroundColor(Colors.ColorRolesPrimaryMint)
        .opacity(1)
    }
  }
}

#Preview {
    StaticSlider()
      
}
