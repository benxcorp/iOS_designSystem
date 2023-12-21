//
//  ArtistSelectView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/18.
//

import SwiftUI

struct ArtistSelectView: View {
  @Binding var isPresented: Bool
  @Environment(\.dismiss) var dismiss
  private let genre = ["#HIP HOP", "#POP","#INDIE", "#LATIN", "#ALTER\nNATIVE", "#METAL", "#ROCK", "R&B"]
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
             
                CommonButton(type: .text("Finished"),
                             textColor: .white,
                             fontSize: 17, action: {
                  isPresented = false
                })
                .frame(width: 153, height: 52)
                .background(Colors.surfaceGray900)
                .clipShape(RoundedRectangle(cornerRadius: 100))
              
              
              CommonButton(type: .text("Skip"),
                           textColor: Colors.textDefault,
                           fontSize: 15) {
                isPresented = false
              }
                           .frame(width: 153,
                                  height: 10)
            }
          }
          .frame(maxWidth: .infinity,
                 maxHeight: .infinity)
        }
      }
      .navigationBarBackButtonHidden(true)
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
    GeometryReader { proxy in
      ScrollView(.vertical) {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 18, content: {
          ForEach(genre, id: \.self) { title in
            VStack(spacing: 8) {
              SelectableButton(type: .image(""))
                .frame(height: (proxy.size.width - 20) / 2 - 3.5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
              Text("NCT127")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Colors.textDefault)
            }
          }
        })
      }
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
  ArtistSelectView(isPresented: .init(get: {
    true
  }, set: { _ in
    
  }))
}
