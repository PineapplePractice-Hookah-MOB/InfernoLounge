//
//  SaleAndBonusInfo.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

struct SaleAndBonusInfo: View {
    var body: some View {
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .frame(width: 170, height: 77)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
          VStack {
            MarkText("Ваша постоянная скидка", size: 12, weight: .bold)
              .foregroundColor(.white)
            MarkText("5%", size: 20)
              .foregroundColor(.white)
              .padding(.top, 13)
          }
        }
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .frame(width: 170, height: 77)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
          VStack {
            MarkText("Ваши баллы", size: 12, weight: .bold)
              .foregroundColor(.white)
            MarkText("567 баллов", size: 20)
              .foregroundColor(.white)
              .padding(.top, 13)
          }
        }
      }
    }
}

#Preview {
    SaleAndBonusInfo()
}
