//
//  ArtistHome.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/26.
//

import SwiftUI

struct ArtistHomeView: View {
    var body: some View {
      ScrollView(.vertical) {
        VStack {
          ListeningPartySimpleView()
        }
      }
    }
}

#Preview {
  ArtistHomeView()
}
