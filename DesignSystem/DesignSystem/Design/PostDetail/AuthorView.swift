//
//  AuthorView.swift
//  DesignSystem
//
//  Created by kevinkim2586 on 2023/12/21.
//

import SwiftUI

struct AuthorView: View {
  
  let showOfficialBadge: Bool
  let showMoreButton: Bool
  
  var body: some View {
    HStack {
      Image("c2_bts")
        .resizable()
        .scaledToFill()
        .frame(width: 32, height: 32)
        .clipShape(Circle())
      
      Spacer().frame(width: 9)
      
      VStack(alignment: .leading, spacing: 2) {
        
        HStack {
          Text("Jungkook")
            .font(.system(size: 14, weight: .bold))
          
          Spacer().frame(width: 3)
          
          if showOfficialBadge {
            Button {
              
            } label: {
              Image("ic_officialbadge_s")
                .frame(width: 13, height: 13)
            }
          }
          Spacer()

        }
      
        
        Text("11.17. 17:09")
          .font(.system(size: 12, weight: .medium))
          .foregroundStyle(.gray)
          .multilineTextAlignment(.leading)
        
 
      }
    
      Spacer()
      
      if showMoreButton {
        Button {
          
        } label: {
          Image("btn_list_more")
            .foregroundStyle(Color(.darkGray))
            .frame(width: 20, height: 26)
        }
      }
    }
    .frame(height: 36)
    .padding(.horizontal, 20)
  }
}

#Preview {
  AuthorView(showOfficialBadge: true, showMoreButton: true)
}
