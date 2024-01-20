//
//  OtherViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI

final class OtherViewModel: ObservableObject {
  init(coordinator: OtherCoordinator) {
    self.coordinator = coordinator
  }
  
  private let coordinator: OtherCoordinator
  private let apiManager = ApiManager()

  @Published var feedback: String = ""
  @Published var isPresenting: Bool = false
  @Published var answer = ""

  func postFeedback() {
    answer = apiManager.postFeedback( userId: "1", text: feedback)
  }

  func makeAPhoneCall() {
  let url: NSURL = URL(string: "TEL://80256369099")! as NSURL
  UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
  }
}
