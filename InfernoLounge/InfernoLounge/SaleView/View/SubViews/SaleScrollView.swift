//
//  SaleTabView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.10.23.
//

import SwiftUI

struct SaleScrollView: View {

  @Binding var sales: [Sale]

  let config = [GridItem(.fixed(140))]
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVGrid(columns: config, content: {
        ForEach(sales, id: \.id) { sale in
          ZStack {
            RoundedRectangle(cornerRadius: 5)
              .frame(width: 350, height: 140)
              .foregroundColor(Color(uiColor: .dark))
            VStack {
              HStack {
                MarkText("\(sale.sale)", size: 15)
                  .foregroundColor(.white)
                  .multilineTextAlignment(.center)
                Spacer()
              }
                .padding(.leading, 20)
              Spacer()
              HStack {
                Spacer()
                MarkText("\(sale.price)", size: 30)
                  .foregroundColor(.white)

              }
                .padding(.trailing, 20)
            }
              .padding()
          }
        }
      })
    }
      .padding([.leading, .trailing], 10)
  }
}
