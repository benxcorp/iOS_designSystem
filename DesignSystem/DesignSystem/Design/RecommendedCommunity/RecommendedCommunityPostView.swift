//
//  RecommendedCommunityPostView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct RecommendedCommunityPostView: View {
  private let data: FeedData
  init(data: FeedData) {
    self.data = data
  }
    var body: some View {
      VStack(alignment: .leading, spacing: 0) {
        VStack {
          titleView
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
        
        Text("Wow, CARATs, I can't believe this has happened in my entire lifeIt's exciting. I'll continue to work hard!")
          .font(.system(size: 15, weight: .medium))
          .foregroundStyle(Colors.textDefault)
          .lineLimit(nil)
          .padding(.horizontal, 20)
          
          
        
        Spacer()
          
      }
      .background(.white)
      
    }
  
  var titleView: some View {
   
      VStack(alignment: .leading, spacing: 2) {
        Text(data.profileName)
          .font(.system(size: 15, weight: .bold))
          .foregroundStyle(Colors.textDefault)
        
        Text(data.date)
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(Colors.textGray500)
      }
    
    .frame(height: 37)
    .padding(.horizontal, 20)
  }
}

#Preview {
  RecommendedCommunityPostView(data: .init(profileName: "test name", image: "", date: "10:20", content: "askldjaskjdlkajk"))
}
