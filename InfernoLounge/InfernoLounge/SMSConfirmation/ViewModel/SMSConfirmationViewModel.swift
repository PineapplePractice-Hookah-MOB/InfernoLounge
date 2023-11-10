//
//  SMSConfirmationViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

final class SMSConfirmationViewModel: ObservableObject {

  init(coordinator: SMSConfirmationCoordinator) {
    self.coordinator = coordinator
  }
  

  @Published var sms = ""
  private let coordinator: SMSConfirmationCoordinator

  func next() {
    coordinator.next()
  }
}
