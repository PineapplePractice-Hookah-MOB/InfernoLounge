//
//  ProfileAndPoinView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

struct ProfileAndPoinView: View {
  var body: some View {

      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .frame(height: 170)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
          VStack(alignment: .leading) {
            HStack(alignment: .top) {
              Image("profile 1")

              Image("pencil")
                .padding(.leading)
            }
            MontserratText("Андрей", size: 20, weight: .medium)
              .foregroundColor(.white)
              .padding(.top)
            MontserratText("+7 (991) 167 88 94", size: 10)
              .foregroundColor(.gray)
          }
        }
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
            .frame(height: 170)
          VStack {
            MontserratText("567 баллов", size: 22, weight: .medium)
              .foregroundColor(.white)
            MontserratText("Ваша постоянная скидка 5%", size: 9, weight: .medium)
              .foregroundColor(.gray)
            MontserratText("Как потратить баллы?", size: 10, weight: .medium)
              .foregroundColor(.gray)
              .padding(.top, 70)
          }
        }
      }
      .padding([.trailing, .leading])
    }
}

#Preview {
    ProfileAndPoinView()
}
