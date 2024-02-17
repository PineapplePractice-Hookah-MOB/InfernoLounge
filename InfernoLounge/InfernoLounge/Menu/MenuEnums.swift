//
//  MenuEnums.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 1.11.23.
//

import SwiftUI

enum CategoriesMenu: Int, CaseIterable {
  case tea = 0
  case hookah

  var imageName: String {
    switch self {
    case .tea:
      return "Чай"
    case .hookah:
      return "Кальяны"
    }
  }
  var tapImageName: String {
    switch self {
    case .tea:
      return "tapЧай"
    case .hookah:
      return "tapКольяны"
    }
  }

  var name: String {
    switch self {
    case .tea:
      return "Чай"
    case .hookah:
      return "Кальяны"
    }
  }
}
