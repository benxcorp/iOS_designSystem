//
//  HomeView.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/20.
//

import SwiftUI

struct HomeView: View {
  @State var isPresentedOnboardingView = false
  let section = HomeSections()
  var body: some View {
    GeometryReader { proxy in
      VStack {
        HStack(spacing: 20) {
          Image("logo")
          Spacer()
          Image("search")
          Image("bell")
          
        }
        .frame(height: 20)
        .padding(.horizontal, 20)
        ScrollView(.vertical, showsIndicators: false) {
          LazyVGrid(columns: [GridItem(.flexible())], content: {
            ForEach(section.sections) { section in
              SectionView(type: section, size: proxy.size)
            }
          })
        }
        
      }
      .background()
    }
    .fullScreenCover(isPresented: $isPresentedOnboardingView,
                     content: {
      GenreSelectView(isPresented: $isPresentedOnboardingView)
    })
    .onAppear {
      //isPresentedOnboardingView = true
    }
    
  }
}

extension HomeView {
  struct SectionView: View {
    let type: HomeView.Section
    let size: CGSize
    var body: some View {
      
      switch type {
      case .joinedCommunityList(let array):
        ScrollView(.horizontal) {
          LazyHGrid(rows: [GridItem(.fixed(50))], content: {
            ForEach(array) { community in
              VStack(spacing: 6) {
                Image(community.image)
                  .resizable()
                  .scaledToFill()
                  .frame(width: 80)
                  .clipShape(Circle())
                Text(community.communityName)
                  .font(.system(size: 12, weight: .bold))
              }

            }
          })
        }
        .frame(height: 140)
        .padding(.horizontal, 20)
      case .shopBanner(let banner):
        ShopBannerView()
          .frame(width: size.width - 20, height: size.width - 20)
      case .recommendedCommunity(let community):
        Color.blue
      case .listeningParty(let listeningParty):
        ListeningPartyView()
          .frame(width: size.width - 20, height: (size.width - 20) * 1.16)
          .clipShape(RoundedRectangle(cornerRadius: 20))
          .compositingGroup()
          .shadow(radius: 5)
          
      case .feed(let array):
        Text("Placeholder")
      }
    }
    
  }
    enum Section: Identifiable {
      var id: String {
        switch self {
        case .joinedCommunityList:
          return "joinedCommunityList"
        case .shopBanner:
          return "shopBanner"
        case .recommendedCommunity:
          return "recommendedCommunity"
        case .listeningParty:
          return "listeningParty"
        case .feed:
          return "feed"
        }
      }
      
      case joinedCommunityList([Community])
      case shopBanner(Banner)
      case recommendedCommunity(Community)
      case listeningParty(ListeningParty)
      case feed([FeedData])
    }
}

#Preview {
  HomeView()
}
