//
//  DiscoverMainView.swift
//  DesignSystem
//
//  Created by jooni on 2023/12/27.
//

import SwiftUI

struct DiscoverTag: Hashable {
  let color: Color
  let image: String?
  let tag: String
}
struct DiscoverMainView: View {
  
  enum ItemType: Hashable {
    case image(image: String, ratio: CGFloat)
    case video(image: String, duration: Int)
    case tags(title: String, tags: [DiscoverTag])
    case post(image: String?, content: String)
  }
  
  @State var searchTextAreaIsHidden: Bool = false
  @State var scrollViewOffset: CGPoint = .zero {
    didSet {
      if scrollViewOffset.y <= 0 && oldValue.y < scrollViewOffset.y { return }
      if scrollViewOffset.y + scrollViewFrame.height + searchBarHeight >= contentsHeight { return }
      searchTextAreaIsHidden = oldValue.y < scrollViewOffset.y
    }
  }
  @State var topContentsHeight: CGFloat = 0
  @State var middleContentsHeight: CGFloat = 0
  @State var bottomContentsHeight: CGFloat = 0
  @State var scrollViewFrame: CGRect = .zero
  
  private let searchBarHeight: CGFloat = 68
  var contentsHeight: CGFloat {
    topContentsHeight + middleContentsHeight + bottomContentsHeight
  }
  
  init() {
    
    let topItems: [ItemType] = [
      .image(image: "discover_1", ratio: 1.34),
      .video(image: "discover_2", duration: 191),
      .tags(title: "Suggested Tags", tags: [DiscoverTag(color: .brown, image: nil, tag: "billie eilish"), DiscoverTag(color: .purple, image: nil, tag: "Light Stick"), DiscoverTag(color: .gray, image: nil, tag: "Selfie"), DiscoverTag(color: .orange, image: nil, tag: "Tour Merch")]),
      .post(image: "discover_3", content: "It's snowing🌨️ in Korea today. Good luck with your concert！.."),
      .image(image: "discover_4", ratio: 1.18),
      .video(image: "discover_5", duration: 148) // 0.64
    ]
    self.topGridItem = gridItemWithItems(topItems)
    
    let bottomItems: [ItemType] = [
      .image(image: "discover_1", ratio: 1.34),
      .video(image: "discover_2", duration: 191),
      .tags(title: "Suggested Tags", tags: [DiscoverTag(color: .brown, image: nil, tag: "billie eilish"), DiscoverTag(color: .purple, image: nil, tag: "Light Stick"), DiscoverTag(color: .gray, image: nil, tag: "Selfie"), DiscoverTag(color: .orange, image: nil, tag: "Tour Merch")]),
      .post(image: "discover_3", content: "It's snowing🌨️ in Korea today. Good luck with your concert！..")
    ]
    self.bottomGridItem = gridItemWithItems(bottomItems)
  }
  
  private let itemWidth = (UIScreen.main.bounds.width - 10*2 - 9)/2
  
  var topGridItem: (left: [ItemType], right: [ItemType]) = (left: [], right: [])
  var bottomGridItem: (left: [ItemType], right: [ItemType]) = (left: [], right: [])
  
  func gridItemWithItems(_ items: [ItemType]) -> (left: [ItemType], right: [ItemType]) {
    var leftItems = [ItemType]()
    var rightItems = [ItemType]()
    
    var leftHeight = CGFloat(0)
    var rightHeight = CGFloat(0)
    for itemType in items {
      if leftHeight <= rightHeight {
        leftItems.append(itemType)
        switch itemType {
        case let .image(_, ratio):
          leftHeight += (itemWidth * ratio)
        case .video:
          leftHeight += (itemWidth * 0.64)
        case let .post(image, content):
          leftHeight += (image != nil ? itemWidth : 0)
          leftHeight += 30 // boundingRect
        case .tags(_, let tags):
          leftHeight += (50 * CGFloat(tags.count)) + (10 * CGFloat(tags.count-1)) + 40
        }
      } else {
        rightItems.append(itemType)
        switch itemType {
        case let .image(_, ratio):
          rightHeight += (itemWidth * ratio)
        case .video:
          rightHeight += (itemWidth * 0.64)
        case let .post(image, _):
          rightHeight += (image != nil ? itemWidth : 0)
          rightHeight += 10 + 51 + 10 // boundingRect
        case .tags(_, let tags):
          rightHeight += (50 * CGFloat(tags.count)) + (10 * CGFloat(tags.count-1)) + 40
        }
      }
    }
    
    return (left: leftItems, right: rightItems)
  }
  
  func imageView(image: String, ratio: CGFloat) -> some View {
    Image(image)
      .resizable()
      .scaledToFill()
      .frame(width: itemWidth, height: itemWidth * 1.34)
      .background(Color(.black))
      .cornerRadius(20)
      .clipped()
  }
  
  func videoView(image: String, duration: Int) -> some View {
    ZStack {
      Image(image)
        .resizable()
        .scaledToFill()
      VStack {
        Spacer()
        HStack {
          Spacer()
          Text("\(duration/60):\(duration%60)")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.white)
            .frame(height: 15)
          Spacer().frame(width: 11)
        }
        Spacer().frame(height: 19)
      }
    }
    .frame(width: itemWidth, height: itemWidth * 0.65)
    .background(Color(.black))
    .cornerRadius(20)
    .clipped()
  }
  
  func tagViewWithTag(_ tag: DiscoverTag) -> some View {
    ZStack {
      if let image = tag.image {
        Image(image)
          .resizable()
          .scaledToFill()
      }
      Text(tag.tag)
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.white)
        .background(Color(.clear))
        .frame(alignment: .center)
    }
    .frame(width: itemWidth, height: 50)
    .background(tag.color)
    .cornerRadius(16)
    .clipped()
  }
  
  func tagView(title: String, tags: [DiscoverTag]) -> some View {
    VStack {
      Spacer().frame(height: 12)
      Text(title)
        .font(.system(size: 15, weight: .bold))
        .foregroundColor(Colors.textDefault)
      ForEach(tags, id: \.self) { tag in
        Spacer().frame(height: 10)
        tagViewWithTag(tag)
      }
      Spacer().frame(height: 10)
    }
    .cornerRadius(20)
    .frame(width: itemWidth, height: CGFloat(12 + 18 + 10 + tags.count*50 + (tags.count-1)*10))
  }
  
  func postView(image: String?, content: String) -> some View {
    VStack {
      if let img = image {
        Image(img)
          .resizable()
          .scaledToFill()
          .frame(width: itemWidth, height: itemWidth)
          .clipped()
      }
      ZStack {
        Rectangle()
          .background(Color(red: 0.14, green: 0.25, blue: 0.32))
        VStack {
          Spacer().frame(height: 10)
          Text(content)
            .font(.system(size: 13, weight: .medium))
            .fixedSize(horizontal: false, vertical: true)
            .lineSpacing(3)
            .foregroundColor(.white)
            .frame(width: itemWidth - 14*2, alignment: .topLeading)
          
          Spacer().frame(height: 10)
        }
      }
    }
    .frame(width: itemWidth, height: itemWidth + 10 + 51 + 10)
    .background(Color(.black))
    .cornerRadius(20)
    .clipped()
  }
  
  @ViewBuilder
  func gridViewWithItem(_ item: ItemType) -> some View {
    switch item {
    case let .image(image, ratio):
      imageView(image: image, ratio: ratio)
    case let .video(image, duration):
      videoView(image: image, duration: duration)
    case let .tags(title, tags):
      tagView(title: title, tags: tags)
    case let .post(image, content):
      postView(image: image, content: content)
    }
  }
  
  var body: some View {
    VStack {
      titleView
      gridView
    }
  }
   
  var titleView: some View {
    SearchBar()
      .padding(EdgeInsets(top: 8, leading: 10, bottom: 10, trailing: 10))
      .frame(height: searchTextAreaIsHidden ? 0 : searchBarHeight)
      .clipped()
  }
  
  @ViewBuilder
  var gridView: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        HStack(alignment: .top, spacing: 9, content: {
          LazyVGrid(columns: [GridItem(.flexible(maximum: itemWidth))]) {
            ForEach(topGridItem.left, id: \.self) { itemType in
              gridViewWithItem(itemType)
            }
          }
          
          LazyVGrid(columns: [GridItem(.flexible(maximum: itemWidth))]) {
            ForEach(topGridItem.right, id: \.self) { itemType in
              gridViewWithItem(itemType)
            }
          }
        })
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .background(GeometryReader {
          Color.clear
            .preference(key: ScrollViewOffsetKey.self,
                        value: CGPoint(x: $0.frame(in: .named("scroll")).origin.x,
                                       y: -$0.frame(in: .named("scroll")).origin.y))
        })
        .onPreferenceChange(ScrollViewOffsetKey.self) { scrollViewOffset = $0 }
        .background(
          GeometryReader { proxy in
            Color.clear.onAppear { topContentsHeight = proxy.size.height }
          }
        )
        
        ZStack {
          Image("discover_6")
            .resizable()
            .scaledToFill()
        }
        .frame(width: (UIScreen.main.bounds.width - 10*2), height: (UIScreen.main.bounds.width - 10*2) * 0.65)
        .background(Color(.blue))
        .cornerRadius(20)
        .clipped()
        .background(
          GeometryReader { proxy in
            Color.clear.onAppear { middleContentsHeight = 150 } // 임시 
          }
        )
        
        
        HStack(alignment: .top, spacing: 9, content: {
          LazyVGrid(columns: [GridItem(.flexible(maximum: itemWidth))]) {
            ForEach(bottomGridItem.left, id: \.self) { itemType in
              gridViewWithItem(itemType)
            }
          }
          LazyVGrid(columns: [GridItem(.flexible(maximum: itemWidth))]) {
            ForEach(bottomGridItem.right, id: \.self) { itemType in
              gridViewWithItem(itemType)
            }
          }
        })
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .background(
          GeometryReader { proxy in
            Color.clear.onAppear { bottomContentsHeight = proxy.size.height }
          }
        )
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .coordinateSpace(name: "scroll")
      .background(GeometryReader { proxy in
        Color.clear.onAppear { scrollViewFrame = proxy.frame(in: .global) }
      })
//      .gesture(DragGesture().onChanged({ value in
//        searchTextAreaIsHidden = value.translation.height < 0
//      }))
    }
  }
  
}

struct ScrollViewOffsetKey: PreferenceKey {
  typealias Value = CGPoint
  static var defaultValue = CGPoint.zero
  static func reduce(value: inout Value, nextValue: () -> Value) {
    var oldValue = value
    oldValue.y += nextValue().y
    value = oldValue
  }
}

struct SearchBar: View {

  var body: some View {
    HStack {
      ZStack {
        CommonButton(type: .text(""), textColor: .clear, fontSize: 10) {
        }
        HStack {
          Image("ico_search")
          Spacer().frame(width: 5)
          Text("Search")
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(Colors.textGray600)
        }
        .padding(.horizontal)
      }
      .foregroundColor(.secondary)
      .background(Color(.secondarySystemBackground))
      .cornerRadius(25)
    }
  }
}
