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
        MarkText("Бонусы", size: 25)
          .padding(.leading, 20)
          .padding(.top, 80)
        PointView()
        MarkText("Акции", size: 25)
          .padding([.top, .leading], 20)
        SaleSubView(sales: $viewModel.sale)
          .onTapGesture {
          viewModel.toSale()
        }
        Spacer()
      }
      MyTabBar(selectedTab: 0)
        .environmentObject(viewModel)
    }
  }
}

#Preview {
  MainView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
