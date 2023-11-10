//
//  SMSConfirmationView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

struct SMSConfirmationView: View {

  @StateObject var viewModel: SMSConfirmationViewModel

    var body: some View {
      ZStack(alignment: .bottom) {
        Color(uiColor: .darkBackground)
          .ignoresSafeArea()
        Image("Smokemini")
        VStack {
          Image("лого")
            .padding(.top, 55)
          MarkText("Вход", size: 25, weight: .bold)
            .padding(.top, 50)
          MarkText("Введите 4 последние цифры номера", size: 16)
            .padding([.leading, .trailing], 40)
            .padding(.top, 10)
          CustomTextField(placeHolder: "Введите код из смс", text: $viewModel.sms)
            .padding(.top, 86)
          Button(action: {
            viewModel.next()
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
              MarkText("Далее", size: 16)
                .font(.system(size: 16, weight: .bold))
            }
          })
          .padding(.top, 152)
          Spacer()
        }
      }
      .ignoresSafeArea()
    }
}

#Preview {
  SMSConfirmationView(viewModel: SMSConfirmationViewModel(coordinator: SMSConfirmationCoordinator()))
}
