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
      VStack(spacing: 0) {
        HStack(spacing: 20) {
          Image("logo")
          Spacer()
          Image("search")
          Image("bell")
            .modifier(BadgeCountViewModifier(font: .system(size: 11, weight: .bold),
                                             badgeColor: Colors.colorLightRed600,
                                             count: 5, radius: 15))
          
        }
        .frame(height: 44)
        .padding(.horizontal, 20)
        
        ScrollView(showsIndicators: false) {
          LazyVGrid(columns: [GridItem(.flexible())], spacing: 18, content: {
            
            
            ForEach(section.sections) { section in
              SectionView(type: section, size: proxy.size)
            }
          })
        }
        Spacer()
      }
    }
    .fullScreenCover(isPresented: $isPresentedOnboardingView,
                     content: {
      GenreSelectView(isPresented: $isPresentedOnboardingView)
    })
    .onAppear {
      isPresentedOnboardingView = false
    }
    
  }
}

extension HomeView {
  struct SectionView: View {
    let type: HomeView.Section
    let size: CGSize
   
    func itemSize(count: Int) -> CGFloat {
      let width: CGFloat = size.width - 40 - CGFloat(count * 8)
      print(width)
      return  width / 4
    }
    var body: some View {
    
      switch type {
      case .joinedCommunityList(let array):
        ScrollView(.horizontal) {
          LazyHGrid(rows: [GridItem(.flexible())], alignment: .top, content: {
            ForEach(array) { community in
              if community.communityName.isEmpty {
                  Colors.surfaceGray100
                  .frame(width: itemSize(count: array.count), height: itemSize(count: array.count))
                    .clipShape(Circle())
                    .overlay(Image("plus_black"))
              } else {
                VStack(spacing: 6) {
                  Image(community.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemSize(count: array.count), height: itemSize(count: array.count))
                    .clipShape(Circle())
                  
                  Text(community.communityName)
                    .font(.system(size: 12, weight: .bold))
                  Spacer()
                }
                .frame(alignment: .top)
              }
            }
          })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
     
      case .shopBanner(let banner):
        ShopBannerView()
          .frame(width: size.width - 20, height: size.width - 20)

      case .recommendedCommunity(let community):
        
        VStack(spacing: 18) {
          RecommendedCommunityHeader()
            .frame(width: size.width, height: 250)
          
          RecommendedCommunityMVView()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(height: 130)
          if let data = community.recommendedFeedData {
            RecommendedCommunityPostView(data: data)
              .clipShape(RoundedRectangle(cornerRadius: 20))
              .frame(height: 130)
              .shadow(radius: 10)
          }
          
          CommonButton(type: .text("Go to Official Home"), textColor: .white, fontSize: 15) {
            
          }
          .frame(width: 195, height: 42)
          .background(.black)
          .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        .padding(.horizontal, 10)
        
        
        
        
      case .listeningParty(let listeningParty):
        ListeningPartyView()
          .frame(width: size.width - 20, height: (size.width - 20) * 1.16)
          .clipShape(RoundedRectangle(cornerRadius: 20))
          .shadow(radius: 20)
      case .feed(let array):
        LazyVStack(spacing: 10) {
          ForEach(array, id: \.self) { community in
            FeedView(feedData: community)
              
            
          }
        }
        .compositingGroup()
        .shadow(radius: 20)
        .padding(.horizontal, 10)
        
        
        
        
        
        
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
