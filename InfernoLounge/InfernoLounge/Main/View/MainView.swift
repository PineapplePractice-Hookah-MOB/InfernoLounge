//
//  MainView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct MainView: View {

  @StateObject var viewModel: MainViewModel
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack(alignment: .leading) {
        TopView()
          .padding(.top, 16)
        MarkText("Бонусы", size: 25, weight: .bold)
          .padding(.leading, 20)
          .padding(.top, 80)
        PointView()
          .onTapGesture {
            viewModel.toBonusHistory()
          }
        MarkText("Акции", size: 25, weight: .bold)
          .padding([.top, .leading], 20)
        SaleSubView(sales: $viewModel.sale)
          .onTapGesture {
          viewModel.toSale()
        }
          .padding(.leading, 10)
        Spacer()
      }
    }
  }
}

#Preview {
  MainView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
