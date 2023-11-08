//
//  OtherCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI

class OtherCoordinator: Coordinator {

  var rootViewController = UIViewController()
  var parentCoordinator: Coordinator?
  
  var childCoordinators: [Coordinator] = []

  func start() {
    let vm = OtherViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: OtherView(viewModel: vm))

    rootViewController = pickViewController
  }
  

}
