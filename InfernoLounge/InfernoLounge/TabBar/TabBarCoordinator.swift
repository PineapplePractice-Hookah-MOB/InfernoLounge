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
    let vm = TabBarViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: MyTabBar(viewModel: vm, selectedTab: 0))

    rootViewController = pickViewController
    let mainCoordinator = MainCoordinator()
    childCoordinators.append(mainCoordinator)
    mainCoordinator.start()

    let saleCoordinator = SaleCoordinator()
    childCoordinators.append(saleCoordinator)

  }

  func toHome() {
    let mainCoordinator = MainCoordinator()
    childCoordinators.append(mainCoordinator)
    mainCoordinator.start()
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

  func toOther() {
    let otherCoordinator = OtherCoordinator()
    otherCoordinator.start()
    childCoordinators.append(otherCoordinator)
    let vc = otherCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }

}
