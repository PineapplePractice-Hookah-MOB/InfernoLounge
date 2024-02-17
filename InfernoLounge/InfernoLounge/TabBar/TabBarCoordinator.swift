//
//  TabBarCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

final class TabBarCoordinator: Coordinator {

  var rootViewController = UIViewController()
  var parentCoordinator: Coordinator?

  var childCoordinators: [Coordinator] = []

  func start() {
    let coordinators: [Coordinator] = [
      MainCoordinator(),
      SaleCoordinator(),
      TableCoordinator(),
      MenuCoordinator(),
      OtherCoordinator()
    ]
    coordinators.forEach { $0.start() }

    let controllers = coordinators.compactMap { $0.rootViewController }

    let tabBar = CustomTabBarController(childControllers: controllers)
    rootViewController = tabBar
  }
}
