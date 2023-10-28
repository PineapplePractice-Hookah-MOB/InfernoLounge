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
        .stroke(.black, lineWidth: 1)
        .frame(width: 350, height: 168)
      VStack {
        HStack {
          MarkText("567", size: 40)
          MarkText("Баллов", size: 20)
          Spacer()
        }
          .padding(.bottom, 40)
          .padding(.leading, 40)
        HStack {
          Spacer()
          MarkText("Ваша постоянная скидка", size: 12)
          MarkText("5%", size: 40)
        }
          .padding(.trailing, 40)
      }
    }
  }
}

#Preview {
  PointView()
}
