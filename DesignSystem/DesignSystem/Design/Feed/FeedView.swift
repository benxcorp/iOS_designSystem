//
//  FeedView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct FeedView: View {
  private let feedData: FeedData
  init(feedData: FeedData) {
    self.feedData = feedData
  }
  var body: some View {
      VStack(spacing: 0) {
        VStack {
          titleView
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 24)
        
        if feedData.image.isEmpty == false {
          Image(feedData.image)
            .resizable()
            .scaledToFill()
            .frame(height: 219)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        ReactionView()
          .frame(height: 57)
        
        Text("Wow, CARATs, I can't believe this has happened in my entire lifeIt's exciting. I'll continue to work hard!")
          .font(.system(size: 15, weight: .medium))
          .foregroundStyle(Colors.textDefault)
          .lineLimit(nil)
          .padding(.horizontal, 20)
          
        Spacer()
          .frame(height: 24)
        Spacer()
          
      }
      .background(.white)
      //.compositingGroup()
      .clipShape(RoundedRectangle(cornerRadius: 20))
      //.shadow(color: .yellow, radius: 2)
  }
  
  var titleView: some View {
    HStack(spacing: 12) {
      Image("profile_img")
        .resizable()
        .scaledToFill()
        .clipShape(Circle())
        .frame(width: 37)
      VStack(alignment: .leading, spacing: 2) {
        Text(feedData.profileName)
          .font(.system(size: 15, weight: .bold))
          .foregroundStyle(Colors.textDefault)
        
        Text(feedData.date)
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(Colors.textGray500)
      }
    }
    .frame(height: 37)
    .padding(.horizontal, 20)
  }
}

#Preview {
  FeedView(feedData: .init(profileName: "name", image: "", date: "10:20", content: "hello!"))
}
