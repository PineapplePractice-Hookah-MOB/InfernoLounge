//
//  AppCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI
import Combine

class AppCoordinator: Coordinator {

  var rootViewController: UIViewController = UINavigationController()

  var childCoordinators: [Coordinator] = []

  let window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    let loginCoordinator = LoginCoordinator()
    loginCoordinator.start()
    self.childCoordinators = [loginCoordinator]
    window.rootViewController = loginCoordinator.rootViewController
    window.makeKeyAndVisible()
  }
}
