//
//  MainCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

final class MainCoordinator: Coordinator {

  var parentCoordinator: Coordinator?
  var rootViewController = UIViewController()
  var childCoordinators: [Coordinator] = []

  func start() {
    let vm = MainViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: MainView(viewModel: vm))

    rootViewController = pickViewController
  }

  func toHome() {

  }

  func toSale() {
    let saleCoordinator = SaleCoordinator()
    saleCoordinator.start()
    childCoordinators.append(saleCoordinator)
    let vc = saleCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }

  func toTable() {
    let tableCoordinator = TableCoordinator()
    tableCoordinator.start()
    childCoordinators.append(tableCoordinator)
    let vc = tableCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }

  func toMenu() {
    let menuCoordinator = MenuCoordinator()
    menuCoordinator.start()
    childCoordinators.append(menuCoordinator)
    let vc = menuCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }
}
