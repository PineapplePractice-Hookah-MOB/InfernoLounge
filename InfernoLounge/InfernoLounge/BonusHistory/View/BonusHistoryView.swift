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
        Color(uiColor: UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1))
          .edgesIgnoringSafeArea(.all)
        VStack {
          Image("wlogo")
          Image("profileBonus")
            .padding(.top, 30)
          MontserratText("Андрей", size: 25, weight: .medium)
            .foregroundColor(.white)
          SaleAndBonusInfo()
            .padding(.top, 20)
          HistoryBonus(bonusHistorys: $viewModel.bonusHistory)
        }
      }
    }
}

#Preview {
  BonusHistoryView(viewModel: BonusHistoryViewModel(coordinator: BonusHistoryCoordinator()))
}
