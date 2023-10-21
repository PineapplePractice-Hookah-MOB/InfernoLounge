//
//  LoginCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI

final class LoginCoordinator: Coordinator {

  var rootViewController: UINavigationController

  var childCoordinators: [Coordinator] = []

  init() {
    rootViewController = UINavigationController()
    rootViewController.navigationBar.isHidden = true
  }

  func start() {
    let vm = LoginViewModel(coordinator: self)
    let loginViewController = UIHostingController(rootView: LoginView(viewModel: vm))
    self.rootViewController.viewControllers = [loginViewController]
  }

  func next(havePhone: Bool) {
    if havePhone {
      
    } else {
      let regCoordinator = RegistrationCoordinator()
      regCoordinator.start()
      childCoordinators.append(regCoordinator)
      let vc = regCoordinator.rootViewController
      self.rootViewController.pushViewController(vc, animated: true)
    }
  }
}
