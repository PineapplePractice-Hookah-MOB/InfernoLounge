//
//  TabBarViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {

  init(coordinator: TabBarCoordinator) {
    self.coordinator = coordinator
  }

  private let coordinator: TabBarCoordinator
}
