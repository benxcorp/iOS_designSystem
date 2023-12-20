//
//  HomeSections.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import Foundation

struct HomeSections {
  let sections: [HomeView.Section]
  
  init() {
    let c1 = Community(image: "c1_bunny",
                      communityName: "Bad Bunny",
                      memberCount: "2399985",
                      recommendedMV: nil,
                      recommendedFeedData: nil)
    let c2 = Community(image: "c2_bts",
                      communityName: "BTS",
                      memberCount: "2399985",
                      recommendedMV: nil,
                      recommendedFeedData: nil)
    let c3 = Community(image: "c3_wkd",
                      communityName: "WEEKND",
                      memberCount: "2399985",
                      recommendedMV: nil,
                      recommendedFeedData: nil)
    let banner = Banner(image: "", title: "Noche de\nBad Bunny", description: "Pre-order now on Weverse Shop!")
    let lp = ListeningParty(image: "lp_artist", albumTitle: "UNFORGIVEN (feat. Nile Rodgers)",
                            albumImage: "",
                            artistName: "LE SSERAFIM",
                            goalCount: "136M",
                            currentCount: "122,430,749")
    let lc = Community(image: "",
                       communityName: "Bad Bunny",
                       memberCount: "2399985",
                       recommendedMV: .init(title: "Bad Bunny - MONACO official MV",
                                            image: "",
                                            date: "May 19, 2023",
                                            duration: "3:11"),
                       recommendedFeedData: .init(title: "Bad Bunny",
                                                  date: "Just now",
                                                  content: "It's snowing🌨️ in Korea today. Good luck with your concert"))
    self.sections = [.joinedCommunityList([c1, c2, c3]),
                     .shopBanner(banner),
                     .listeningParty(lp),
                     .recommendedCommunity(lc)
                     ,.feed([])
    ]
  }
}
