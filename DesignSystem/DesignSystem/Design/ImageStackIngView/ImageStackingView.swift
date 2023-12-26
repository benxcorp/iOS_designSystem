//
//  ImageStackingView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/26.
//

import SwiftUI

struct ImageStackingView: View {
  private let urls: [String]
  private let height: CGFloat
  init(urls: [String], height: CGFloat) {
    self.urls = urls
    self.height = height
  }
  var body: some View {
      HStack(spacing: -height * (1 / 6)) {
        ForEach(Array(urls.enumerated()), id: \.element.self) { (offset, url) in
          if offset == urls.count - 1 {
            Image(url)
              .resizable()
              .clipShape(Circle())
              .frame(width: height,
                     height: height)
              
          } else {
            Image(url)
              .resizable()
              .clipShape(Circle())
              .frame(width: height,
                     height: height)
              .reverseMask {
                Circle().offset(x: height - height * (1 / 4))
              }
          }
        }
      }
      .frame(width: height * CGFloat(urls.count) - CGFloat(urls.count - 1) * (height * (1 / 6)))

  }
}

#Preview {
  ImageStackingView(urls: ["c1_bunny", "c2_bts", "c3_wkd"], height: 18)
}

extension View {
  @inlinable
  public func reverseMask<Mask: View>(
    alignment: Alignment = .center,
    @ViewBuilder _ mask: () -> Mask
  ) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: alignment) {
          mask()
            .blendMode(.destinationOut)
        }
    }
  }
}
