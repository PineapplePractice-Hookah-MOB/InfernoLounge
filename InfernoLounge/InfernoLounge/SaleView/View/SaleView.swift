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
    NavigationView {
      ZStack(alignment: .bottom) {
        Color(uiColor: .darkBackground)
          .ignoresSafeArea()
          .edgesIgnoringSafeArea(.bottom)
        VStack {
          TopView(name: viewModel.user.login)
          SaleScrollView(sales: $viewModel.sales)
            .padding([.trailing, .leading], 20)
          Spacer()
        }
      }
    }
      .accentColor(.white)
  }
}

#Preview {
  SaleView(viewModel: SaleViewModel(coordinator: SaleCoordinator(), user: User()))
}
