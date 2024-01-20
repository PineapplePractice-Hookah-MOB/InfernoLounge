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
    ZStack {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
      VStack(alignment: .leading) {
        TopView(name: viewModel.user.login)
          .padding(.top, 14)

        PointView()
          .onTapGesture {
            viewModel.toBonusHistory()
          }
          .padding(.top, 106)
          .padding([.trailing, .leading], 20)
        MontserratText("Акции", size: 25, weight: .bold)
          .foregroundColor(.white)
          .padding([.top, .leading], 20)
        SaleSubView(sales: $viewModel.sale)
          .onTapGesture {
          viewModel.toSale()
        }
          .padding(.leading, 10)
          .padding(.top)
        Spacer()
      }
    }
  }
}

#Preview {
  MainView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
