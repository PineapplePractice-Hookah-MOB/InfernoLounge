//
//  BonusHistory.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

struct BonusHistoryView: View {

  @StateObject var viewModel: BonusHistoryViewModel

  var body: some View {
    ZStack {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
      VStack {
        Image("wlogo")
          .padding(.top, 50)
        Image("profileBonus")
          .padding(.top, 30)
        MontserratText(viewModel.user.login, size: 25, weight: .medium)
          .foregroundColor(.white)
        SaleAndBonusInfo()
          .padding(.top, 20)
        HistoryBonus(bonusHistorys: $viewModel.bonusHistory)
      }
        .ignoresSafeArea()
    }.ignoresSafeArea()
  }
}

#Preview {
  BonusHistoryView(viewModel: BonusHistoryViewModel(coordinator: BonusHistoryCoordinator()))
}
