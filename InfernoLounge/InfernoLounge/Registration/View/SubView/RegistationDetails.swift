//
//  RegistationDetails.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import SwiftUI

struct RegistationDetails: View {
  @Binding var login: String
  @Binding var name: String
  @Binding var dateOfBirthday: String
  @Binding var password: String
  @Binding var confirmPassword: String

    var body: some View {
      VStack(spacing: 35) {
        CustomTextField(placeHolder: "Введите email", text: $login)
        CustomTextField(placeHolder: "Введите имя", text: $name)
        CustomTextField(placeHolder: "Введите дату рождения", text: $dateOfBirthday)
        VStack(alignment: .center) {
          SecureField("", text: $password, prompt: Text("Пароль").foregroundColor(.gray))
            .foregroundColor(.white)
            .frame(width: 348, height: 45)
            .multilineTextAlignment(.leading)
            .overlay(
            Rectangle()
              .fill(Color.white)
              .frame(width: 348, height: 1), alignment: .bottom)
        }
        VStack(alignment: .center) {
          SecureField("", text: $confirmPassword, prompt: Text("Повторите пароль").foregroundColor(.gray))
            .foregroundColor(.white)
            .frame(width: 348, height: 45)
            .multilineTextAlignment(.leading)
            .overlay(
            Rectangle()
              .fill(Color.white)
              .frame(width: 348, height: 1), alignment: .bottom)
        }
      }
    }
}
