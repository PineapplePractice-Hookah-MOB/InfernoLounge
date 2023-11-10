//
//  TabBarViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
  case home = 0
  case sale
  case table
  case menu
  case others

  var iconName: String {
    switch self {
    case .home:
      return "home"
    case .sale:
      return "sale"
    case .table:
      return "table"
    case .menu:
      return "menu"
    case .others:
      return "others"
    }
  }
  var tapIconName: String {
    switch self {
    case .home:
      return "tapMain"
    case .sale:
      return "tapSale"
    case .table:
      return "tapTable"
    case .menu:
      return "tapMenu"
    case .others:
      return "tapOther"
    }
  }

}


final class TabBarViewModel: ObservableObject {

  init(coordinator: TabBarCoordinator) {
    self.coordinator = coordinator
  }

  func didTapTabBar(_ tab: TabbedItems) {
    switch tab {
    case .home:
      print("toHome")
      coordinator.toHome()
    case .sale:
      coordinator.toSale()
    case .table:
      coordinator.toTable()
    case .menu:
      coordinator.toMenu()
    case .others:
      coordinator.toOther()
    }
  }

  private let coordinator: TabBarCoordinator
}
