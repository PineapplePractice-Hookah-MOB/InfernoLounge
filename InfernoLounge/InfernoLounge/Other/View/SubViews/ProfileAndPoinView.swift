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
            .frame(width: 170, height: 170)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
          VStack(alignment: .leading) {
            HStack(alignment: .top) {
              Image("profile 1")

              Image("pencil")
                .padding(.leading)
            }
            MarkText("Андрей", size: 20, weight: .medium)
              .foregroundColor(.white)
              .padding(.top)
            MarkText("+7 (991) 167 88 94", size: 10)
              .foregroundColor(.gray)
          }
        }
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
            .frame(width: 170, height: 170)
          VStack {
            MarkText("567 баллов", size: 22, weight: .medium)
              .foregroundColor(.white)
            MarkText("Ваша постоянная скидка 5%", size: 9, weight: .medium)
              .foregroundColor(.gray)
            MarkText("Как потратить баллы?", size: 10, weight: .medium)
              .foregroundColor(.gray)
              .padding(.top, 70)
          }
        }
      }
    }
}

#Preview {
    ProfileAndPoinView()
}
