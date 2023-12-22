//
//  SideMenu.swift
//  DesignSystem
//
//  Created by kevinkim2586 on 2023/12/21.
//

import SwiftUI


///
/// 사용 예시
///
///     struct HomeView: View {
///       @State var showSideMenu: Bool = false
///
///       var body: some View {
///         VStack {
///           Image("test")
///             .onTapGesture {
///               withAnimation(.easeInOut) {
///                 showSideMenu.toggle()
///               }
///             }
///         }
///         .offset(x: showSideMenu ? (UIScreen.main.bounds.width / 3) * 2 : 0)
///         .overlay {
///           SideMenu<ArtistSelectionSideView>(
///             childView: ArtistSelectionSideView(),
///             isShown: $showSideMenu
///           )
///         }
///       }
///     }



struct SideMenu<Content: View>: View {
  
  let childView: Content
  @Binding var isShown: Bool
  
  let width: CGFloat = (UIScreen.main.bounds.width / 3) * 2
  
  var body: some View {
    HStack {
      childView
        .frame(maxWidth: self.width, alignment: .leading)
    }
    .background {
      if isShown {
        Rectangle()
          .fill(Color.black.opacity(0.75))
          .offset(x: (UIScreen.main.bounds.width / 3) * 2)
          .ignoresSafeArea()
          .onTapGesture {
            withAnimation(.bouncy) {
              isShown.toggle()
            }
          }
          .animation(.snappy, value: isShown)
      }
    }
    .offset(x: isShown ? 0 : -width)
    .ignoresSafeArea()
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct ArtistSelectionSideView: View {
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading) {
        
        Section(
          header: Text("My Artists")
            .font(.system(size: 17, weight: .bold))
            .padding())
        {
          
          VStack(alignment: .leading, spacing: 16) {
            
            ForEach(0..<3, id: \.self) { _ in
              HStack(spacing: 8) {
                Image("c2_bts")
                  .resizable()
                  .clipShape(Circle())
                  .frame(width: 36, height: 36)
                Text("BTS")
                  .font(.system(size: 16, weight: .bold))
              }
            }
            
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading)
        }
        
        Spacer().frame(height: 30)
        
        Divider()
        
        Spacer().frame(height: 30)
        
        Section(
          header: Text("Recommended")
            .font(.system(size: 17, weight: .bold))
            .padding())
        {
          
          VStack(alignment: .leading, spacing: 16) {
            
            ForEach(0..<3, id: \.self) { _ in
              
              HStack(spacing: 8) {
                Image("c1_bunny")
                  .resizable()
                  .clipShape(Circle())
                  .frame(width: 36, height: 36)
                
                Text("New Jeans")
                  .font(.system(size: 16, weight: .medium))
                  .lineLimit(1)
                  .font(.system(size: 16, weight: .bold))
                  .minimumScaleFactor(0.85)
                
                Spacer()
                
                Button {
                  
                } label: {
                  Image("select_add")
                    .resizable()
                    .frame(width: 27, height: 27)
                }
              }
              .frame(height: 36)
              .frame(maxWidth: 196, alignment: .leading)
              
            }
            
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading)
        }
        
        
      }
      
    }
    .padding()
    .padding(.top, 50)
  }
}

#Preview {
  SideMenu<ArtistSelectionSideView>(childView: ArtistSelectionSideView(), isShown: .constant(true))
}
