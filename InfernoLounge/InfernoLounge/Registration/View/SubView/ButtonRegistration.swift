//
//  ButtonRegistration.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import SwiftUI

struct ButtonRegistration: View {

  @Environment(\.dismiss) var dismiss
  let disabled: Bool

    var body: some View {
      Button(action: {
        dismiss.callAsFunction()
              }, label: {
          ZStack {
            HStack {
              Image("left")
                .padding(.top, 40)
                .padding(.leading, 52)
              Spacer()
              Image("right")
                .padding(.bottom, 40)
                .padding(.trailing, 52)
            }
            RoundedRectangle(cornerRadius: 5)
              .stroke(.white, lineWidth: 1)
              .foregroundColor(.clear)
              .frame(width: 278, height: 72)
            MontserratText("Далее", size: 16)
              .foregroundColor(.white)
              .font(.system(size: 16, weight: .bold))
          }
        })
        .disabled(disabled)
    }
}

#Preview {
  ButtonRegistration(disabled: true)
}
