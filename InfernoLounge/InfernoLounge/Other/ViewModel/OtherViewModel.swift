//
//  OtherViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI
import Combine

final class OtherViewModel: ObservableObject {
  init(coordinator: OtherCoordinator) {
    self.coordinator = coordinator
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: {
        self.user = SinletonUser.shared.user
      }))
  }

  private let coordinator: OtherCoordinator
  private let apiManager = ApiManager()

  @Published var feedback: String = ""
  @Published var isPresenting: Bool = false
  @Published var answer = "Напишите отзыв"
  @Published var user = User()

  func postFeedback() -> Bool {
    if feedback != "" {
      apiManager.postFeedback(userId: "\(user.id)", text: self.feedback) { [weak self] answer in
        DispatchQueue.main.async {
          self?.answer = answer
        }
      }
      return true
    } else {
      return false
    }
  }

  func makeAPhoneCall() {
    let url: NSURL = URL(string: "TEL://80256369099")! as NSURL
    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
  }
}
