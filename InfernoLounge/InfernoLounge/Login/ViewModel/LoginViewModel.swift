//
//  LoginViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI
import Combine



final class LoginViewModel: ObservableObject {

  init(coordinator: LoginCoordinator) {
    self.coordinator = coordinator
      getUsers()
  }

  private let coordinator: LoginCoordinator
  private let api = ApiManager()
  private var cancellable = Set<AnyCancellable>()

  @Published var login = ""
  @Published var password = ""
  @Published var users = [User]()
  @Published var showText: Bool = false

  func goToMain() {
    coordinator.goToMain()
  }

  func goToRegistration() {
    coordinator.goToRegistation()
  }
}

extension LoginViewModel {
  private func getUsers() {
    api.getUsers()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] users in
        self?.users = users
        print(self?.users)
      }
      .store(in: &cancellable)
  }

  func checkUser()  {
    for user in users {
      if login != user.email {
      } else {
        goToMain()
      }
    }
  }
}
