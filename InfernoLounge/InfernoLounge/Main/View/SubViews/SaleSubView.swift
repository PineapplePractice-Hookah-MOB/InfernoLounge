//
//  SaleView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct SaleSubView: View {

  @Binding var sales: [Sale]
  let columns = [GridItem(.fixed(176))]
  var widthView = UIScreen.main.bounds.width - 40
  var body: some View {

    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: columns, content: {
        ForEach(sales, id: \.id) { sale in
          ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 5)
              .frame(width: widthView, height: 176)
              .foregroundColor(.white)
            Image(sale.photo)
              .resizable()
            VStack(alignment: .trailing) {
              MontserratText("\(sale.sale)", size: 20, weight: .medium)
                .foregroundColor(.white)
              MontserratText("\(sale.price)", size: 30, weight: .bold)
                .foregroundColor(.white)
              MontserratText("\(sale.time)", size: 15)
                .foregroundColor(.white)
            }
              .padding(.trailing, 20)
          }
            .background(Image("sales")
              .resizable()
              .aspectRatio(contentMode: .fill))

            .scrollTransition { content, phase in
            content
              .scaleEffect(phase.isIdentity ? 1 : 0.3)
              .opacity(phase.isIdentity ? 1 : 0.3)
          }
        }
      })
        .scrollTargetLayout()

    }
      .scrollTargetBehavior (.viewAligned)
  }
}
