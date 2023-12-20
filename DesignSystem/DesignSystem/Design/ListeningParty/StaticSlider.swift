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
  }
  @State var currentPosition: CGFloat = 0
  @State var maxValue: CGFloat = 0
  
  var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .center) {
        Color.black
          .frame(width: proxy.size.width / maxValue, height: proxy.size.height * Constants.sliderLineWidthRatio)
      }
      .frame(maxHeight: .infinity)
    }
  }
}

#Preview {
    StaticSlider()
}
