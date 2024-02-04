//
//  SaleCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.10.23.
//

import SwiftUI

final class SaleCoordinator: Coordinator {
  var rootViewController = UIViewController()
  var parentCoordinator: Coordinator?
  var childCoordinators: [Coordinator] = []

  func start() {
    let vm = SaleViewModel(coordinator: self, user: User())
    let pickViewController = UIHostingController(rootView: SaleView(viewModel: vm))
    rootViewController = pickViewController
    pickViewController.tabBarItem.image = UIImage(named: "sale")
    pickViewController.tabBarItem.selectedImage = UIImage(named: "tapSales")
  }

  func startUser(user: User) {
    let vm = SaleViewModel(coordinator: self, user: user)
    let pickViewController = UIHostingController(rootView: SaleView(viewModel: vm))
    rootViewController = pickViewController
    pickViewController.tabBarItem.image = UIImage(named: "sale")
    pickViewController.tabBarItem.selectedImage = UIImage(named: "tapSales")
  }
}
