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
    NavigationView {
      ZStack {
        Color(uiColor: .darkBackground)
          .ignoresSafeArea()
        VStack(alignment: .leading) {
          TopView(name: viewModel.user.login)
          InfoReservationView(text: viewModel.reservationText)
            .padding([.trailing, .leading], 20)
            .padding(.top, 30)
          NavigationLink {
            BonusHistoryView(viewModel: BonusHistoryViewModel(coordinator: BonusHistoryCoordinator()))
          } label: {
            PointView()
          }
            .padding(.top, 20)
            .padding([.trailing, .leading], 20)
          MontserratText("Акции", size: 25, weight: .bold)
            .foregroundColor(.white)
            .padding([.top, .leading], 20)
          NavigationLink {
            SaleView(viewModel: SaleViewModel(coordinator: SaleCoordinator(), user: viewModel.user))
          } label: {
            SaleSubView(sales: $viewModel.sale)
          }
            .padding([.trailing, .leading], 20)
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
    }.accentColor(.white)
  }
}

#Preview {
  MainView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
