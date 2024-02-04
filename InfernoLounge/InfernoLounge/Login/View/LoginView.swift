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
        .resizable()
        .aspectRatio(contentMode: .fit)
      VStack {
        Image("лого")
          .padding(.top, 55)
        MontserratText("Вход", size: 25, weight: .bold)
          .foregroundColor(.white)
          .padding(.top, 62)
        CustomTextField(placeHolder: "Логин", text: $viewModel.login)
          .keyboardType(.emailAddress)
          .padding(.top, 50)
          .padding([.trailing, .leading])
        MontserratText("Проверьте логин или пароль, либо зарегистрируйтесь", size: 12)
          .foregroundStyle(.red)
          .opacity(viewModel.showText ? 1 : 0)
        VStack(alignment: .center) {
          SecureField("", text: $viewModel.password, prompt: Text("Пароль").foregroundColor(.gray))
            .foregroundColor(.white)
            .frame(height: 45)
            .multilineTextAlignment(.leading)
            .overlay(
            Rectangle()
              .fill(Color.white)
              .frame(height: 1), alignment: .bottom)
        }
          .padding([.trailing, .leading])
          .padding(.top, 36)
        Button(action: {
          viewModel.postAuth()
        }, label: {
            MontserratText("Вход", size: 16)
              .foregroundColor(.white)
              .font(.system(size: 16, weight: .bold))
          })
          .background {
          RoundedRectangle(cornerRadius: 5)
            .stroke(.white, lineWidth: 1)
            .foregroundColor(.clear)
            .frame(width: 278, height: 72)
        }
          .padding(.top, 54)
        Button(action: {
          viewModel.goToRegistration()
          viewModel.showText = false
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
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
          viewModel.getUsers()
        }))
        viewModel.showText = false
      })
  }

}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel(coordinator: LoginCoordinator()))
  }
}
