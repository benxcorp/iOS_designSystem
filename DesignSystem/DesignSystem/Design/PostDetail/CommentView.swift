//
//  CommentView.swift
//  DesignSystem
//
//  Created by kevinkim2586 on 2023/12/22.
//

import SwiftUI

struct CommentView: View {
  
  
  var body: some View {
    VStack(alignment: .leading) {
      
      // 첫번째 열
      HStack(alignment: .top) {
        Image("c2_bts")
          .resizable()
          .scaledToFill()
          .frame(width: 36, height: 36)
          .clipShape(Circle())
          .padding(.top, 2)
        
        Spacer().frame(width: 8)
        
        VStack(alignment: .leading) {
          Spacer().frame(height: 3)
          Text("Jungkook")
            .font(.system(size: 14, weight: .semibold))
          Spacer().frame(height: 2)
          Text("11.17. 17:09")
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color(.darkGray))
          Spacer().frame(height: 3)
        }
        
        Spacer()
        
        Button {
        } label: {
          Image("btn_translate_normal_small")
        }
        .padding(.top, 3)
        
        Spacer().frame(width: 11)
        Button {
          
        } label: {
          Image("btn_list_more")
            .frame(width: 26, height: 26)
        }
        .padding(.trailing, 4)


      }
      .background(Color.mint.opacity(0.5))

      
      Spacer().frame(height: 3)

      // 두번째 열
      
      Text("It's so funny!!th your concert！great spirit!!! give an amazing performance today, you guy!It's so funny!!th your concert！great spirit!!! give an amazing performance today, you guy!")
        .font(.system(size: 15, weight: .regular))
        .lineLimit(10)
        .padding(.leading, 44)
        .padding(.trailing, 12)
        .background(Color.orange.opacity(0.5))
      
      
      // 세번째 열
      
      Spacer().frame(height: 3)
      
      HStack {
        
        Button {
          
        } label: {
          HStack(spacing: 2) {
            Image("btn_top_like_on_wt_light")
              .resizable()
              .frame(width: 16, height: 16)
            
            Text("38k")
              .font(.system(size: 13, weight: .medium))
              .foregroundStyle(.black)
          }
        }
        
        Spacer().frame(width: 10)
        
        Button {
          
        } label: {
          HStack(spacing: 2) {
            Image("btn_reply_small_light")
              .resizable()
              .frame(width: 18, height: 17)
            
            Text("234k")
              .font(.system(size: 13, weight: .medium))
              .foregroundStyle(.black)
          }
        }
        
      }
      .background(Color.black.opacity(0.5))
      .padding(.leading, 42)
      .padding(.top, 7)
      
      
      
      

    }
    .background(Color.blue.opacity(0.5))
    .padding(.leading, 20)
    .padding(.trailing, 8)
    .padding(.top, 13)
    .padding(.bottom, 15)
    .background(Color.red.opacity(0.5))
  }
}

#Preview {
  CommentView()
}
