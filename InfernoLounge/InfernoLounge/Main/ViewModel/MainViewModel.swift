//
//  MainViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI


final class MainViewModel: ObservableObject {

  init(coordinator: MainCoordinator) {
    self.coordinator = coordinator
  }

  private let coordinator: MainCoordinator

  @Published var sale: [Sale] = [Sale(id: 1, sale: "Дневная чашка за 600р. - с 15:00 до 19:00.", price: "600"), Sale(id: 2, sale: "Дневная чашка за 600р. - с 15:00 до 19:00.", price: "600"), Sale(id: 3, sale: "Дневная чашка за 600р. - с 15:00 до 19:00.", price: "600")]

  func toSale() {
    coordinator.toSale()
  }

  func toBonusHistory() {
    coordinator.toBonusHistory()
  }
}
