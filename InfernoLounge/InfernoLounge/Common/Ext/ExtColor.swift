//
//  ExtColor.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

extension UIColor {
  static let darkBackground = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
  static let dark = UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)
}
extension Color {
  var dark: Color {
    return .init(uiColor: .dark)
  }
}
