//
//  RecommendedCommunityMVView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct RecommendedCommunityMVView: View {
    var body: some View {
      ZStack {
        Image("mv_img")
          .resizable()
          .scaledToFill()
          .frame(height: 130)
        
        VStack(alignment: .leading) {
          Spacer()
          Text("Bad Bunny - MONACO official MV")
            .font(.system(size: 14, weight: .bold))
            .foregroundStyle(.white)
          HStack {
            Text("May 19, 2023")
              .font(.system(size: 12, weight: .medium))
              .foregroundStyle(Colors.textGray500)
            Spacer()
            
            Text("3:11")
              .font(.system(size: 14, weight: .bold))
              .foregroundStyle(.white)
          
          }
          Spacer()
            .frame(height: 12)
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 20)
      }
      
    }
}

#Preview {
    RecommendedCommunityMVView()
}
