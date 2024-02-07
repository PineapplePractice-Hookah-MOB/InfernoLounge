//
//  SaleDetailView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 7.02.24.
//

import SwiftUI

struct SaleDetailView: View {
  var sales: [Sale]
  var sale: Sale
  var saleIndex: Int {
    sales.firstIndex(where: {$0.id == self.sale.id})!
  }
    var body: some View {
      ZStack {
        Color(uiColor: .darkBackground)
          .ignoresSafeArea()
        VStack {
          ZStack {
            Image(sale.photo)
              .resizable()
              .frame(height: 200)
            VStack {
              MontserratText(sale.sale, size: 30, weight: .bold)
                .foregroundStyle(.white)
                .padding(.top, 100)
              MontserratText((sale.price), size: 30, weight: .bold)
                .foregroundStyle(.white)
            }
          }
          ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 5)
              .foregroundStyle(Color(uiColor: .dark))
            MontserratText("\(sale.sale) \(sale.time) за \(sale.price)", size: 15)
              .foregroundStyle(.white)
              .padding(.top, 40)
              .padding([.trailing,.leading], 20)
          }
          .padding([.trailing, .leading], 20)
          .padding(.bottom, 100)
          Spacer()
        }
        .ignoresSafeArea()
      }
    }
}

