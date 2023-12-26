//
//  Colors.swift
//  DesignSystem
//
//  Created by sangbum.goh on 2023/12/18.
//

import Foundation
import SwiftUI

struct Colors {
  enum ColorType {
    case textDefault
    case surfaceGray75
    case surfaceGray900
    case textGray500
  }
  static let textDefault = Color(red: 0.04, green: 0.04, blue: 0.04)
  static let surfaceGray75 = Color(red: 0.95, green: 0.95, blue: 0.97)
  static let surfaceGray900: Color = Color(red: 0.07, green: 0.07, blue: 0.07)
  static let textGray500: Color = Color(red: 0.56, green: 0.56, blue: 0.56)
  static let surfaceGray100: Color = Color(red: 0.92, green: 0.93, blue: 0.95)
  static let ColorRolesPrimaryMint: Color = Color(red: 0.03, green: 0.8, blue: 0.79)
  static let colorLightRed600: Color = Color(red: 0.96, green: 0.32, blue: 0.31)
  

}


