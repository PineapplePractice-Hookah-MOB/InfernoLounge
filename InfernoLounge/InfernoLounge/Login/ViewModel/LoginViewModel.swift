//
//  LoginViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI

final class LoginViewModel: ObservableObject {

  init(coordinator: LoginCoordinator) {
    self.coordinator = coordinator
  }

  private let coordinator: LoginCoordinator

  @Published var login = ""
  @Published var password = ""



  func goToMain() {
    coordinator.goToMain()
  }

  func goToRegistration() {
    coordinator.goToRegistation()
  }
}
