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
        InfoReservationView(text: viewModel.reservationText)
          .padding([.trailing, .leading], 20)
          .padding(.top, 30)
        PointView()
          .onTapGesture {
            viewModel.toBonusHistory()
          }
          .padding(.top, 20)
          .padding([.trailing, .leading], 20)
        MontserratText("Акции", size: 25, weight: .bold)
          .foregroundColor(.white)
          .padding([.top, .leading], 20)
        SaleSubView(sales: $viewModel.sale)
          .onTapGesture {
          viewModel.toSale()
        }
          .padding([.trailing,.leading], 20)
          .padding(.top, 20)
        Spacer()
      }
    }
    .onAppear {
        viewModel.getUserTableReservation()
      DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
        viewModel.checkReservation()
      }))
    }
  }
}

#Preview {
  MainView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
