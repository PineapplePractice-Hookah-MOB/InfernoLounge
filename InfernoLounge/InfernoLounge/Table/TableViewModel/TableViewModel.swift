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
  }

  private var coordinator: TableCoordinator

  @Published var count = "1 человек"
  @Published var wishes = "Напишите нам свои пожелания по выбору столика..."
  @Published var selectedDate: Date = .init()
  @Published var datePickerSheetPresenting: Bool = false

  let peopleCount = ["1 человек", "2 человека", "3 человека", "4 человека", "5 человек", "6 и более"]



}
