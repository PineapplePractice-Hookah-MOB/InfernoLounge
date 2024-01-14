//
//  MainViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {

  init(coordinator: MainCoordinator) {
    self.coordinator = coordinator
    getUser()
  }

  private let coordinator: MainCoordinator
  private let api = ApiManager()
  private var cancellable = Set<AnyCancellable>()

  @Published var sale: [Sale] = [Sale(id: 1, sale: "Дневная чашка", price: "600", time: "с 15:00 до 19:00."), Sale(id: 2, sale: "Дневная чашка", price: "600", time: "с 15:00 до 19:00."), Sale(id: 3, sale: "Дневная чашка", price: "600", time: "с 15:00 до 19:00.")]

  @Published var user = User()

  func toSale() {
    coordinator.toSale()
  }

  func toBonusHistory() {
    coordinator.toBonusHistory()
  }
}

extension MainViewModel {
  private func getUser() {
    api.getuser(userId: user.id)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] user in
      self?.user = user
        print(user)
    }
      .store(in: &cancellable)
  }
}
