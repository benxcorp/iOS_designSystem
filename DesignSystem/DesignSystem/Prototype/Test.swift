//
//  Test.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/21.
//

import SwiftUI

struct Test: View {
    var body: some View {
      VStack {
          HStack {
              Image(systemName: "circle").padding()
            
              VStack {
                  Text("Title")
                  Button(action: {}) {
                      VStack { Text("Button") }
                      .padding(4)
                      .background()
                      .frame(height: 40)
                  }
              }
          }.padding()//.background(Color.teal)
      }
      .background(.blue)
      .compositingGroup()
      .shadow(color: .pink, radius: 3, x: 10, y: 10)
    }
}

#Preview {
    Test()
}
