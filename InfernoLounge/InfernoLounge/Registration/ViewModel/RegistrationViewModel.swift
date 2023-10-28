//
//  RegistrationViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

final class RegistrationViewModel: ObservableObject {

  init(coordinator: RegistrationCoordinator) {
    self.coordinator = coordinator
  }

  @Published var name = ""
  @Published var birthDay = ""

  let coordinator: RegistrationCoordinator

  func main() {
    coordinator.toMain()
  }
}
