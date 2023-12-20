//
//  CommonButton.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/18.
//

import SwiftUI

struct CommonButton: View {
  enum ButtonType {
    case text(String)
    case add(String)
    case membership(String)
  }
  private let type: ButtonType
  private let textColor: Color
  private let fontSize: CGFloat
  private var action: (() -> Void)?
  
  init(type: ButtonType,
       textColor: Color,
       fontSize: CGFloat,
       action: (() -> Void)?) {
    self.type = type
    self.textColor = textColor
    self.action = action
    self.fontSize = fontSize
  }
  
    var body: some View {
      Button(action: {
        action?()
      }, label: {
        ZStack {
          switch type {
          case .text(let string):
            Text(string)
              .font(.system(size: fontSize, weight: .bold))
              .foregroundStyle(textColor)
              .frame(maxWidth: .infinity, maxHeight: .infinity)
          case .add(let string):
            Text(string)
              .font(.system(size: fontSize, weight: .bold))
              .foregroundStyle(textColor)
          case .membership(let string):
            Text(string)
              .font(.system(size: fontSize, weight: .bold))
              .foregroundStyle(textColor)
          }
        }
      })
    }
}

#Preview {
  CommonButton(type: .text("Next"),
               textColor: Colors.textDefault, fontSize: 17,
               action: {})
}
