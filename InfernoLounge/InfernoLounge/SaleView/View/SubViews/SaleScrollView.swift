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
      LazyVGrid(columns: config, spacing: 15, content: {
        ForEach(sales, id: \.id) { sale in
          NavigationLink {
            SaleDetailView(sales: sales, sale: sale)
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 5)
                .frame(width: UIScreen.main.bounds.width - 40, height: 140)
                .foregroundColor(Color(uiColor: .dark))
              Image(sale.photo)
                .resizable()
              VStack {
                HStack {
                  MontserratText("\(sale.sale)", size: 15)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                  Spacer()
                }
                  .padding(.leading, 20)
                Spacer()
                HStack {
                  Spacer()
                  MontserratText("\(sale.price)", size: 30)
                    .foregroundColor(.white)
                }
                  .padding(.trailing, 20)
              }
                .padding([.top, .bottom])
            }
              .scrollTransition (.interactive) { content, phase in
              content
                .scaleEffect (phase.isIdentity ? 1.0 : 0.2)
                .opacity (phase.isIdentity ? 1 : 0.5)
                .rotation3DEffect (Angle.degrees (phase .isIdentity ? 0 : 90),
                axis: (x: 0.5, y: 0.0, z: 0.1))
                .offset(x: phase.value * -200)
            }
          }
        }
      })
        .scrollTargetLayout ()
    }
      .scrollTargetBehavior (.viewAligned)
  }
}
