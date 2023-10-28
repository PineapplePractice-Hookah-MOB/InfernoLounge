//
//  SaleView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.10.23.
//

import SwiftUI

struct SaleView: View {

  @ObservedObject var viewModel: SaleViewModel

  var body: some View {
    ZStack(alignment: .bottom) {
      VStack {
        TopView()
        SaleScrollView(sales: $viewModel.sales)
        Spacer()
      }
      MyTabBar(selectedTab: 1)
        .environmentObject(MainViewModel(coordinator: MainCoordinator()))
    }

  }
}

#Preview {
  SaleView(viewModel: SaleViewModel(coordinator: SaleCoordinator()))
}
