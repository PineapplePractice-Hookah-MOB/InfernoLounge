//
//  TableCoordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.10.23.
//

import SwiftUI

final class TableCoordinator: Coordinator {

  var parentCoordinator: Coordinator?
  var rootViewController: UIViewController = UIViewController()
  var childCoordinators: [Coordinator] = []

  func start() {
    let vm = TableViewModel(coordinator: self)
    let pickViewController = UIHostingController(rootView: TableView(viewModel: vm))

    rootViewController = pickViewController
  }
  
  
}
