//
//  MarkText.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct MontserratText: View {
  enum FontWeight: String {
    case regular = "Montserrat-Regular"
    case medium = "Montserrat-Medium"
    case bold = "Montserrat-Bold"
    case heavy = "Montserrat-SemiBold"
  }
  init(_ text: String, size: CGFloat, weight: FontWeight = .regular) {
    self.text = text
    self.size = size
    self.weight = weight
  }

  private let text: String
  private let size: CGFloat
  private let weight: FontWeight

  var body: some View {
    Text(text)
      .font(.custom(weight.rawValue, size: size))
  }
}
