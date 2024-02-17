//
//  BonusHistoryViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

final class BonusHistoryViewModel: ObservableObject {

  init(coordinator: BonusHistoryCoordinator) {
    self.coordinator = coordinator
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: {
        self.user = SinletonUser.shared.user
      }))

  }

  private let coordinator: BonusHistoryCoordinator

  @Published var user = User()
  @Published var bonusHistory: [BonusHistory] = [BonusHistory(id: 1, date: "01.11.2023", summ: "2500p", countBonus: "-75"),
    BonusHistory(id: 2, date: "02.11.2023", summ: "500p", countBonus: "+75"),
    BonusHistory(id: 3, date: "03.11.2023", summ: "1500p", countBonus: "-5"),
    BonusHistory(id: 4, date: "04.11.2023", summ: "3500p", countBonus: "+50"),
    BonusHistory(id: 5, date: "05.11.2023", summ: "6500p", countBonus: "-75")]
}
