//
//  RegistrationCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

final class RegistrationCoordinator: Coordinator {

  var parentCoordinator: Coordinator?
  var rootViewController = UIViewController()
  var childCoordinators: [Coordinator] = []

  func start() {
    let vm = RegistrationViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: RegistationView(vm: vm))

    rootViewController = pickViewController
  }

  func toMain() {
    let tabBarCoordinator = TabBarCoordinator()
    tabBarCoordinator.start()
    let vc = tabBarCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)

  }
}
