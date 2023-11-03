//
//  MenuCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 29.10.23.
//

import SwiftUI

final class MenuCoordinator: Coordinator {
  var parentCoordinator: Coordinator?
  var rootViewController: UIViewController = UIViewController()
  var childCoordinators: [Coordinator] = []
  
  func start() {
    let vm = MenuViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: MenuView(viewModel: vm))

    rootViewController = pickViewController
  }
  
  
}
