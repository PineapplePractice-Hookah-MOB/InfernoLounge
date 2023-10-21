//
//  LoginView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI

struct LoginView: View {

  @ObservedObject var viewModel: LoginViewModel

  var body: some View {
      VStack {
        Image("лого")
          .padding(.top, 36)
        MarkText("Вход", size: 25)
          .font(.system(size: 25, weight: .bold))
        MarkText("Ведите номер вашего телефона в международном формате", size: 16)
          .padding([.leading, .trailing], 64)
          .padding(.top, 10)
          .multilineTextAlignment(.center)
        CustomTextField(placeHolder: "Введите номер телефона", text: viewModel.phoneNumber)
          .padding([.top], 70)
        Spacer()
        Button(action: {
          viewModel.next()
        }, label: {
            ZStack {
              RoundedRectangle(cornerRadius: 12)
                .stroke(.black, lineWidth: 1)
                .foregroundColor(.white)
                .frame(width: 278, height: 72)
              MarkText("Далее", size: 16)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            }
          })
          .padding([.bottom], 120)

      }

    }
  }

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel(coordinator: LoginCoordinator()))
  }
}
