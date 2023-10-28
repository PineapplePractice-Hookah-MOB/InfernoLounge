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
}
