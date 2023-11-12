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
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
      VStack {
        TopView()
        SaleScrollView(sales: $viewModel.sales)
        Spacer()
      }
    }

  }
}

#Preview {
  SaleView(viewModel: SaleViewModel(coordinator: SaleCoordinator()))
}
