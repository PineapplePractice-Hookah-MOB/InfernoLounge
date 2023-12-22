//
//  LoginCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI

final class LoginCoordinator: Coordinator {

  var parentCoordinator: Coordinator?
  var rootViewController = UIViewController()
  var childCoordinators: [Coordinator] = []



  func start() {
    let vm = LoginViewModel(coordinator: self)
    let loginViewController = UIHostingController(rootView: LoginView(viewModel: vm))
    let navigation = UINavigationController(rootViewController: loginViewController)
    navigation.navigationBar.isHidden = true
    rootViewController = navigation
  }

  func goToMain() {
    let tabBarCoordinator = TabBarCoordinator()
    tabBarCoordinator.start()
    let vc = tabBarCoordinator.rootViewController
    self.rootViewController.show(vc, sender: nil)
  }

  func goToRegistation() {
    let registrationCoordinator = RegistrationCoordinator()
    registrationCoordinator.start()
    let vc = registrationCoordinator.rootViewController
    self.rootViewController.show(vc, sender: nil)
  }
}
