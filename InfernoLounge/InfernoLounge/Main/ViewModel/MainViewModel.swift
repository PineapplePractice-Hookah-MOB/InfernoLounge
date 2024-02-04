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
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: { [self] in
      user = SinletonUser.shared.user
      getUserTableReservation()
    }))

  }

  private let coordinator: MainCoordinator
  private let api = ApiManager()
  private var cancellable = Set<AnyCancellable>()
  @Published var user = User()
  @Published var table = [TableReservation]()
  @Published var sale: [Sale] = [Sale(id: 1, sale: "Дневная чашка", price: "600", time: "с 15:00 до 19:00.", photo: "teaDay"), Sale(id: 2, sale: "Два кольяна", price: "600", time: "19:00.", photo: "hokah"), Sale(id: 3, sale: "Скидка в день рождения", price: "20%", time: "", photo: "happy")]
  @Published var reservationText = ""

  func toSale() {
    coordinator.toSale(user: user)
  }

  func toBonusHistory() {
    coordinator.toBonusHistory()
  }

  func getUserTableReservation() {
    api.getTable(userId: user.id)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] reservation in
      self?.table = reservation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
          self?.checkReservation()
        }))
    }
      .store(in: &cancellable)
  }
  func checkReservation() {
    if !table.isEmpty {
      reservationText = "У вас забронирован столик \(table.first?.bookedFrom ?? "")"
    } else {
    }
  }
}
