//
//  Coordinator.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import UIKit

protocol Coordinator {

  var parentCoordinator: Coordinator? { get set }
  var childCoordinators: [Coordinator] { get set }

  func start()
}

