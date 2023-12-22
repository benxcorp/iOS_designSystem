//
//  ReactionView.swift
//  DesignSystem
//
//  Created by kevinkim2586 on 2023/12/22.
//

import SwiftUI

struct ReactionView: View {
  
  var body: some View {
    HStack {
      
      Button {
        
      } label: {
        HStack(spacing: 4) {
          Image("btn_top_like_on_wt_light")
            .frame(width: 24, height: 24)
            .onTapGesture {
            }
          
          Text("38k")
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(.black)
        }
        
      }
      
      Spacer().frame(width: 12)
      
      Button {
        
      } label: {
        HStack(spacing: 4) {
          Image("btn_reply_small_light")
            .frame(width: 22, height: 22)
            .onTapGesture {
            }
          
          Text("234k")
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(.black)
        }
        
      }
      
      
      Spacer()
      
      Button {
        
      } label: {
        Image("btn_player_bookmark")
          .frame(width: 24, height: 24)
          .onTapGesture {
          }
      }
      
      
    }
    .frame(height: 40)
    .padding(.horizontal, 20)
//    .background(Color.blue.opacity(0.5))
  }
}

#Preview {
  ReactionView()
}
//TabView {
//  Image("jungkook")
//    .resizable()
//    .scaledToFill()
//  
//  Image("dog_test2")
//    .resizable()
//    .scaledToFill()
//}
//.frame(height: 400)
//.tabViewStyle(.page)
//.indexViewStyle(.page(backgroundDisplayMode: .interactive))
