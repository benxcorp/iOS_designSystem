//
//  RecommendedCommunityHeader.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct RecommendedCommunityHeader: View {
    var body: some View {
      VStack(spacing: 0) {
        Image("recommeded_community_h")
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .frame(width: 180)
         
        
        Spacer()
          .frame(height: 12)
        
        Text("Bad Bunny")
          .font(.system(size: 32, weight: .heavy))
          .foregroundStyle(Colors.textDefault)
        Spacer()
          .frame(height: 6)
        
        Text("23,448,734 Members")
          .font(.system(size: 12, weight: .medium))
          .foregroundStyle(Colors.textGray500)
      }
    }
    
}

#Preview {
    RecommendedCommunityHeader()
}
