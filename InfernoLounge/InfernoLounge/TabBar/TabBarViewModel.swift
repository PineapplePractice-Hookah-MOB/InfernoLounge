//
//  TabBarViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

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
