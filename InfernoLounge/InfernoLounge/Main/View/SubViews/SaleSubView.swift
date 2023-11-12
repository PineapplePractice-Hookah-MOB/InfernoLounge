//
//  SaleView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct SaleSubView: View {

  @Binding var sales: [Sale]
  let columns = [GridItem(.fixed(140))]
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: columns, content: {
        ForEach(sales, id: \.id) { sale in
          ZStack {
            RoundedRectangle(cornerRadius: 5)
              .stroke(.white, lineWidth: 1)
              .frame(width: 350, height: 140)
              .foregroundColor(.white)
            MarkText("\(sale.sale)", size: 15)
              .foregroundColor(.white)
          }
        }
      })
    }
      .padding([.leading, .trailing], 10)
  }
}
