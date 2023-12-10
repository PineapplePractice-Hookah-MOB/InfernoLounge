//
//  PointView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct PointView: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .stroke(.white, lineWidth: 1)
        .frame(width: 350, height: 168)
      VStack {
        HStack {
          MontserratText("567", size: 40)
            .foregroundColor(.white)
          MontserratText("Баллов", size: 20)
            .foregroundColor(.white)
          Spacer()
        }
          .padding(.bottom, 40)
          .padding(.leading, 40)
        HStack {
          Spacer()
          MontserratText("Ваша постоянная скидка", size: 12)
            .foregroundColor(.white)
          MontserratText("5%", size: 40)
            .foregroundColor(.white)
        }
          .padding(.trailing, 40)
      }
    }
  }
}

#Preview {
  PointView()
}
