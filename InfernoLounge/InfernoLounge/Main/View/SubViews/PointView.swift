//
//  PointView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct PointView: View {
  var body: some View {
    VStack {
      HStack {
        MontserratText("567", size: 40)
          .foregroundColor(.white)
        MontserratText("Баллов", size: 20)
          .foregroundColor(.white)
        Spacer()
      }
        .padding([.bottom, .leading], 40)
        .padding(.top, 20)
      HStack {
        Spacer()
        MontserratText("Ваша постоянная скидка", size: 12)
          .foregroundColor(.white)
        MontserratText("5%", size: 40)
          .foregroundColor(.white)
      }
        .padding(.trailing, 40)
        .padding(.bottom, 20)
    }
      .background { RoundedRectangle(cornerRadius: 5)
        .stroke(.white, lineWidth: 1)
    }
  }
}

#Preview {
  PointView()
}
