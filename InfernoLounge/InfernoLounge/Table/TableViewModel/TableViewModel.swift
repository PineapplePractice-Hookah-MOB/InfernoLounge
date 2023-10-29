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

  @Published var count = "1"
  @Published var wishes = "Напишите нам свои пожелания по выбору столика..."
  private var coordinator: TableCoordinator

  let peopleCount = ["1", "2", "3", "4"]

  @Published var date = Date.now
}
