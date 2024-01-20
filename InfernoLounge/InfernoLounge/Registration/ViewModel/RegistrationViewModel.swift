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
  @Published var email = ""
  @Published var password = ""
  @Published var confirmPassword = ""
  @Published var buttonDisabled: Bool = true
  @Published var tapAgree: Bool = false
  @Published var checkPassword: String = ""

  private let coordinator: RegistrationCoordinator
  private let apiManager = ApiManager()

  func postRegistration() -> Bool {
    if password == confirmPassword {
      apiManager.postRegistration(email: email, name: name, birthday: birthDay, phone: confirmPassword, password: password)
      return true
    } else {
      checkPassword = "Пороли не совпадают"
      return false
    }
  }
}
