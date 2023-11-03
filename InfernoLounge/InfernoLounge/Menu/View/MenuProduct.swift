//
//  MenuProduct.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI

struct MenuProduct: View {
  @Binding var menuProducts: [MenuProducts]
  var body: some View {
    LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))], content: {
        ForEach(menuProducts, id: \.id) { menuProduct in
          ZStack {
            RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 1)
              .frame(width: 170, height: 170)
            VStack(spacing: 10) {
              Image(uiImage: ((menuProduct.image ?? UIImage(named: "menuPlaceHolder"))!))
              MarkText(menuProduct.name, size: 14)
              MarkText(menuProduct.taste, size: 10)
                .foregroundColor(.gray)
                .padding(.top, 1)
              HStack {
                MarkText(menuProduct.size, size: 17)
                Spacer()
                MarkText(menuProduct.price, size: 17)
              }
              .padding([.bottom, .trailing, .leading])
            }
          }
        }

      })
  }
}

