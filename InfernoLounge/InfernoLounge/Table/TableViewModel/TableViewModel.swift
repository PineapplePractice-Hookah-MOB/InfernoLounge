//
//  TableViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.10.23.
//

import SwiftUI

final class TableViewModel: ObservableObject {

  init(coordinator: TableCoordinator) {
    self.coordinator = coordinator
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: {
      self.user = SinletonUser.shared.user
    }))
  }

  private let coordinator: TableCoordinator
  private let apiManager = ApiManager()

  @Published var count = "1 человек"
  @Published var wishes = ""
  @Published var selectedDate: Date = .init()
  @Published var datePickerSheetPresenting: Bool = false
  @Published var buttonDisabled: Bool = false
  @Published var answerServer: String = ""
  @Published var user = User()
  let peopleCount = ["1 человек", "2 человека", "3 человека", "4 человека", "5 человек", "6 и более человек"]
  let days = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
  var tableId: Int = 2
}

extension TableViewModel {
  func postTable () {
    if selectedDate >= Date.now {
      apiManager.postTable(tableId: tableId, people: Int(count.first?.description ?? "0") ?? 0, userId: user.id, comment: wishes, bookedFrom: "\(selectedDate.dateFormat())", bookedTill: "\(selectedDate.addingTimeInterval(60*60).dateFormat())") {
        [weak self] answer in
        DispatchQueue.main.async {
          self?.answerServer = answer
        }
      }
    } else {
      answerServer = "Выбирете другую дату"
    }
  }
}
