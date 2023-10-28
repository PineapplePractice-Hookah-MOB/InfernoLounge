//
//  SaleViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.10.23.
//

import SwiftUI

final class SaleViewModel: ObservableObject {

  init(coordinator: SaleCoordinator) {
    self.coordinator = coordinator
  }

  let coordinator: SaleCoordinator

  @Published var sales: [Sale] = [Sale(id: 1, sale: "Дневная чашка 15:00 до 19:00.", price: "600p"), Sale(id: 2, sale: "Два кальяна до 19:00", price: "1000p"), Sale(id: 3, sale: "Скидка в день рождения", price: "20%"), Sale(id: 4, sale: "Дневная чашка 15:00 до 19:00.", price: "600p")]

}


