//
//  MenuProduct.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI

struct MenuProduct: View {

  var selectedMenuCategory: Int
  var products: [MenuProducts]

  var body: some View {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
        ForEach(products, id: \.id) { menuProduct in
          ZStack {
            RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 1)
              .frame(height: 170)
            VStack(spacing: 10) {
              Image(selectedMenuCategory == 0 ? menuProduct.image ?? "menuPlaceHolder": menuProduct.image ?? "Кальяны")
                .foregroundStyle(.white)
                .padding(.top)
              MontserratText(menuProduct.name, size: 14)
                .foregroundColor(.white)
              MontserratText(menuProduct.taste, size: 10)
                .foregroundColor(.white)
                .foregroundColor(.gray)
                .padding(.top, 1)
              HStack {
                MontserratText(menuProduct.size ?? "", size: 17)
                  .foregroundColor(.white)
                Spacer()
                MontserratText(menuProduct.price, size: 17)
                  .foregroundColor(.white)
              }
                .padding([.bottom, .trailing, .leading])
            }
          }
        }
      })
  }
}

