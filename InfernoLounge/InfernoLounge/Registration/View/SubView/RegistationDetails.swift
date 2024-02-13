//
//  RegistationDetails.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import SwiftUI

struct RegistationDetails: View {
  @Binding var email: String
  @Binding var name: String
  @Binding var dateOfBirthday: String
  @Binding var password: String
  @Binding var confirmPassword: String
  @Binding var isEmailValid: Bool
  var text: String
  var checkBirthday: String

  var body: some View {
    VStack(spacing: 35) {
      VStack(alignment: .center) {
        CustomTextField(placeHolder: "Введите email", text: $email)
          .onChange(of: email) { newValue in
          isEmailValid = isValidEmail(newValue)
          print(isEmailValid)
        }
        MontserratText("Проверьте логин или пароль, либо зарегистрируйтесь", size: 12)
          .foregroundStyle(.red)
          .opacity(isEmailValid ? 0 : 1)
      }
      CustomTextField(placeHolder: "Введите имя", text: $name)
      VStack {
        CustomTextField(placeHolder: "2020-11-22", text: $dateOfBirthday)
          .keyboardType(.numberPad)
          .onChange(of: dateOfBirthday) { _ in
          self.dateOfBirthday = cleanBirthday
        }
        MontserratText(checkBirthday, size: 12)
          .foregroundStyle(.red)
          .padding(.top, -5)
      }
      VStack(alignment: .center) {
        SecureField("", text: $password, prompt: Text("Пароль").foregroundColor(.gray))
          .foregroundColor(.white)
          .frame(height: 45)
          .multilineTextAlignment(.leading)
          .overlay(
          Rectangle()
            .fill(Color.white)
            .frame(height: 1), alignment: .bottom)
      }
      VStack(alignment: .center) {
        SecureField("", text: $confirmPassword, prompt: Text("Повторите пароль").foregroundColor(.gray))
          .foregroundColor(.white)
          .frame(height: 45)
          .multilineTextAlignment(.leading)
          .overlay(
          Rectangle()
            .fill(Color.white)
            .frame(height: 1), alignment: .bottom)
        MontserratText(text, size: 12)
          .foregroundStyle(.red)
      }
    }
  }
}

extension RegistationDetails {
  func isValidEmail(_ email: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
    return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
  }

  private var cleanBirthday: String {
    var clean = dateOfBirthday.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    if clean.count > 8 {
      clean = String(clean.prefix(8))
    }
    if clean.count > 4 {
      clean.insert("-", at: clean.index(clean.startIndex, offsetBy: 4))
    }
    if clean.count > 7 {
      clean.insert("-", at: clean.index(clean.startIndex, offsetBy: 7))
    }
    return clean
  }
}
