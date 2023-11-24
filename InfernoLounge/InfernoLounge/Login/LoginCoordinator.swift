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

  func next(havePhone: Bool) {
    if havePhone {

    } else {
      let SMSConfirmationCoordinator = SMSConfirmationCoordinator()
      SMSConfirmationCoordinator.start()
      childCoordinators.append(SMSConfirmationCoordinator)
      let vc = SMSConfirmationCoordinator.rootViewController
      self.rootViewController.show(vc, sender: nil)
    }
  }
}
