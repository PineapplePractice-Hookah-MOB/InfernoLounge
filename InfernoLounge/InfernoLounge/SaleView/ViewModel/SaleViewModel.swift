//
//  SaleViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.10.23.
//

import SwiftUI

final class SaleViewModel: ObservableObject {

  init(coordinator: SaleCoordinator, user: User) {
    self.coordinator = coordinator
    self.user = user
  }

  let coordinator: SaleCoordinator
  let user: User

  @Published var sales: [Sale] = [Sale(id: 1, sale: "Дневная чашка c 15:00 до 19:00.", price: "600p", time: "c 15:00 до 19:00."), Sale(id: 2, sale: "Два кальяна до 19:00", price: "1000p", time: "до 19:00"), Sale(id: 3, sale: "Скидка в день рождения", price: "20%", time: ""), Sale(id: 4, sale: "Дневная чашка c 15:00 до 19:00.", price: "600p", time: "c 15:00 до 19:00."), Sale(id: 5, sale: "Дневная чашка c 15:00 до 19:00.", price: "600p", time: "c 15:00 до 19:00.")]

}


