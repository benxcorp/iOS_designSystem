//
//  SelectableButton.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/18.
//

import SwiftUI

struct SelectableButton: View {
  enum ButtonType {
    case text(String, LinearGradient)
    case image(String)
    
  }
  private let type: ButtonType
  @State private var selected: Bool = false
  init(type: ButtonType) {
    self.type = type
  }
  var body: some View {
    ZStack {
      switch type {
      case .image(let url):
        HStack {
          Spacer()
          selectButton
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topTrailing)
        .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 12))
        EmptyView()
      case let .text(title, background):
        HStack {
          Spacer()
          selectButton
          
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topTrailing)
        .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 12))
        Text(title)
          .font(.system(size: 24, weight: .heavy))
          .multilineTextAlignment(.center)
          .foregroundColor(selected ? Color.white : Colors.textDefault)
      }
    }
    .background(backgroundView)
    .animation(.easeInOut)
    
  }
  
  @ViewBuilder
  var backgroundView: some View {
    switch type {
    case .text(_, let linearGradient):
      if selected {
        linearGradient
      } else {
        Colors.surfaceGray75
      }
    case .image:
      Image("nct_image")
        .resizable()
        .scaledToFill()
    }
  }
  
  @ViewBuilder
  var whiteCircle: some View {
    Color.white
      .clipShape(Circle())
  }
  
  @ViewBuilder
  var selectButton: some View {
    switch type {
    case .text(_, let linearGradient):
      Button(action: {
        selected.toggle()
      },label: {
        Image(selected ? "select_add" : "select_add")
      })
    case .image:
      Button(action: {
        selected.toggle()
      },label: {
        if selected {
          Image("select_add")
        } else {
          whiteCircle
            .frame(width: 26, height: 26)
        }
      })
    }
  }
}

#Preview {
  SelectableButton(type: .text("#HIP HOP",
                               LinearGradient(
                               stops: [
                               Gradient.Stop(color: Color(red: 0.63, green: 0.26, blue: 1), location: 0.00),
                               Gradient.Stop(color: Color(red: 0.07, green: 1, blue: 1), location: 1.00),
                               ],
                               startPoint: UnitPoint(x: 0.13, y: 0.11),
                               endPoint: UnitPoint(x: 0.95, y: 0.94)
                               )))
  
}
