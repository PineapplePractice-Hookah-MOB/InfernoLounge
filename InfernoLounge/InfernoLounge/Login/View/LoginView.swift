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
    ZStack(alignment: .bottom) {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
      Image("Smokemini")
      VStack {
        Image("лого")
          .padding(.top, 55)
        MarkText("Вход", size: 25, weight: .bold)
          .foregroundColor(.white)
          .padding(.top, 50)
        MarkText("Ведите номер вашего телефона в международном формате", size: 16)
          .foregroundColor(.white)
          .padding([.leading, .trailing], 64)
          .padding(.top, 10)
          .multilineTextAlignment(.center)
        CustomTextField(placeHolder: "Введите номер телефона", text: $viewModel.phoneNumber)
          .padding(.top, 65)
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
              .foregroundColor(.white)
              .font(.system(size: 16, weight: .bold))
          }
        })
        .padding(.top, 147)
        Spacer()
      }
    }
    .ignoresSafeArea()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel(coordinator: LoginCoordinator()))
  }
}
