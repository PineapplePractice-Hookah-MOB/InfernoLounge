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
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: {
        self.user = SinletonUser.shared.user
      }))
  }

  let coordinator: SaleCoordinator
  @Published var user: User = User()

  @Published var sales: [Sale] = [Sale(id: 1, sale: "Дневная чашка", price: "600р.", time: "с 15:00 до 19:00", photo: "teaDay"), Sale(id: 2, sale: "Два кальяна", price: "600р.", time: "до 19:00", photo: "hokah"), Sale(id: 3, sale: "Скидка в день рождения", price: "20%", time: "", photo: "happy"), Sale(id: 4, sale: "Дневная чашка", price: "600р", time: "с 15:00 до 19:00", photo: "teaDay"), Sale(id: 5, sale: "Два кальяна", price: "600р.", time: "до 19:00", photo: "hokah"), Sale(id: 6, sale: "Скидка в день рождения", price: "20%", time: "", photo: "happy"), Sale(id: 7, sale: "Дневная чашка", price: "600р.", time: "с 15:00 до 19:00", photo: "teaDay"), Sale(id: 8, sale: "Два кальяна", price: "600р.", time: "до 19:00", photo: "hokah"), Sale(id: 9, sale: "Скидка в день рождения", price: "20%", time: "", photo: "happy")]

}


