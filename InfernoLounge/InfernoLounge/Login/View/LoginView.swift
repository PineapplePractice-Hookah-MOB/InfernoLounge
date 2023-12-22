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
        MontserratText("Вход", size: 25, weight: .bold)
          .foregroundColor(.white)
          .padding(.top, 62)
        CustomTextField(placeHolder: "Логин", text: $viewModel.login)
          .padding(.top, 50)
        VStack(alignment: .center) {
          SecureField("", text: $viewModel.password, prompt: Text("Пароль").foregroundColor(.gray))
            .foregroundColor(.white)
            .frame(width: 348, height: 45)
            .multilineTextAlignment(.leading)
            .overlay(
            Rectangle()
              .fill(Color.white)
              .frame(width: 348, height: 1), alignment: .bottom)
        }
        .padding(.top, 36)
        Button(action: {
          viewModel.goToMain()
        }, label: {
          ZStack {
            RoundedRectangle(cornerRadius: 5)
              .stroke(.white, lineWidth: 1)
              .foregroundColor(.clear)
              .frame(width: 278, height: 72)
            MontserratText("Вход", size: 16)
              .foregroundColor(.white)
              .font(.system(size: 16, weight: .bold))
          }
        })
        .padding(.top, 54)
        Button(action: {
          viewModel.goToRegistration()
        }, label: {
          ZStack {
            RoundedRectangle(cornerRadius: 5)
              .foregroundColor(.white)
              .frame(width: 278, height: 72)
            MontserratText("Регистрация", size: 16)
              .foregroundColor(.black)
              .font(.system(size: 16, weight: .bold))
          }
        })
        .padding(.top, 28)
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
