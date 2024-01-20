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
    pickViewController.tabBarItem.image = UIImage(named: "home")
    pickViewController.tabBarItem.selectedImage = UIImage(named: "tapMain")
  }

  func toSale(user: User) {
    let saleCoordinator = SaleCoordinator()
    saleCoordinator.startUser(user: user)
    childCoordinators.append(saleCoordinator)
    let vc = saleCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }

  func toBonusHistory() {
    let bonusHistoryCoordinator = BonusHistoryCoordinator()
    bonusHistoryCoordinator.start()
    childCoordinators.append(bonusHistoryCoordinator)
    let vc = bonusHistoryCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }
}
