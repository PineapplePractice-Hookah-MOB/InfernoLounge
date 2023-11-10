//
//  SMSConfirmationCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

final class SMSConfirmationCoordinator: Coordinator {
  var rootViewController = UIViewController()
  var parentCoordinator: Coordinator?
  
  var childCoordinators: [Coordinator] = []
  
  func start() {
    let vm = SMSConfirmationViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: SMSConfirmationView(viewModel: vm))

    rootViewController = pickViewController
  }

  func next() {
    let regCoordinator = RegistrationCoordinator()
    regCoordinator.start()
    childCoordinators.append(regCoordinator)
    let vc = regCoordinator.rootViewController
    self.rootViewController.navigationController?.pushViewController(vc, animated: true)
  }

  

}
