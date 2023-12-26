//
//  BadgeCountViewModifier.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/26.
//

import SwiftUI

struct BadgeCountViewModifier: ViewModifier {
  private let font: Font
  private let badgeColor: Color
  private let count: Int
  private let radius: CGFloat
  
  init(font: Font, badgeColor: Color, count: Int, radius: CGFloat) {
    self.font = font
    self.badgeColor = badgeColor
    self.count = count
    self.radius = radius
  }
  
  func body(content: Content) -> some View {
    content
      .overlay(
        ZStack {
          badgeColor
            .clipShape(Circle())
          Text("\(count)")
            .font(font)
            .foregroundStyle(.white)
          }
          .frame(width: radius, height: radius)
          .offset(x: UIMath.cos45 * radius - 2 , y: -UIMath.sin45 * radius + 2)
      )
  }
}
