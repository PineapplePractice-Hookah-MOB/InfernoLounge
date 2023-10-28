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
    let vm = SaleViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: SaleView(viewModel: vm))

    rootViewController = pickViewController
  }
}
