//
//  BonusHistoryCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

final class BonusHistoryCoordinator: Coordinator {
  
  var parentCoordinator: Coordinator?
  var childCoordinators: [Coordinator] = []
  var rootViewController = UIViewController()

  func start() {
    let vm = BonusHistoryViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: BonusHistoryView(viewModel: vm))

    rootViewController = pickViewController
  }
}
