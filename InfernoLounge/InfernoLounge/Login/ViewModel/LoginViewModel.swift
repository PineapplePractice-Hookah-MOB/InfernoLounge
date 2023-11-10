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

  @Published var phoneNumber = ""


  func next() {
    if phoneNumber == "12345" {
      print("no")
      coordinator.next(havePhone: true)
    } else {
      coordinator.next(havePhone: false)
      print("yes")
    }
  }
}
