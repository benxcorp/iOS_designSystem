//
//  ContentView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/18.
//

import SwiftUI

struct GenreSelectView: View {
  @Binding var isPresented: Bool
  private let genre = ["#HIP HOP", "#POP","#INDIE", "#LATIN", "#ALTER\nNATIVE", "#METAL", "#ROCK", "R&B"]
  private let gradient = LinearGradient(
    stops: [
      Gradient.Stop(color: Color(red: 0.63, green: 0.26, blue: 1), location: 0.00),
      Gradient.Stop(color: Color(red: 0.07, green: 1, blue: 1), location: 1.00),
    ],
    startPoint: UnitPoint(x: 0.13, y: 0.11),
    endPoint: UnitPoint(x: 0.95, y: 0.94)
  )
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack(alignment: .leading, spacing: 0) {
          titleView
          Spacer()
            .frame(height: 30)
          itemView
          Spacer()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .overlay(gradientMask)
        .padding(EdgeInsets(top: 40, leading: 10, bottom: 0, trailing: 10))
        
        VStack {
          Spacer()
          VStack(spacing: 20) {
            NavigationLink(destination: ArtistSelectView(isPresented: $isPresented)) {
              CommonButton(type: .text("Next"),
                           textColor: .white,
                           fontSize: 17, action: nil)
              .frame(width: 153, height: 52)
              .background(Colors.surfaceGray900)
              .clipShape(RoundedRectangle(cornerRadius: 100))
              .disabled(true)
            }
            
            CommonButton(type: .text("Skip"),
                         textColor: Colors.textDefault,
                         fontSize: 15) {
            }
                         .frame(width: 153,
                                height: 10)
          }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
      }
    }
  }
  
  
  @ViewBuilder
  var titleView: some View {
    HStack{
      Spacer()
        .frame(width: 10)
      Text("Tell us which\nyou love")
        .font(.system(size: 38, weight: .heavy))
        .foregroundColor(Colors.textDefault)
        .lineSpacing(0)
    }
  }
  
  @ViewBuilder
  var itemView: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
        ForEach(genre, id: \.self) { title in
          SelectableButton(type: .text(title, gradient))
            .frame(height: 129)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
      })
    }
  }
  
  @ViewBuilder
  var gradientMask: some View {
    VStack {
      Spacer()
      Color.white.mask {
        VStack(spacing: 0) {
          LinearGradient(
            colors: [
              Color.black.opacity(1),
              Color.black.opacity(0),
            ],
            startPoint: .bottom,
            endPoint: .top
          )
          Rectangle()
        }
      }
      .frame(height: 110)
    }
    .allowsHitTesting(false)
    .frame(maxHeight: .infinity)
  }
}

#Preview {
  GenreSelectView(isPresented: .init(get: {
    true
  }, set: { _ in
    
  }))
}
