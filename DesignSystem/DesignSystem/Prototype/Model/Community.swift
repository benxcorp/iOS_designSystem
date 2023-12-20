//
//  Community.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import Foundation

struct Community: Identifiable {
  var id: String { communityName }
  
  
  let image: String
  let communityName: String
  let memberCount: String
  let recommendedMV: Video?
  let recommendedFeedData: FeedData?
}
