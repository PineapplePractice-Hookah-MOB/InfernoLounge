//
//  RegistrationViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

final class RegistrationViewModel: ObservableObject {

  init(coordinator: RegistrationCoordinator) {
    self.coordinator = coordinator
  }

  @Published var name = ""
  @Published var birthDay = ""
  @Published var email = ""
  @Published var password = ""
  @Published var confirmPassword = ""
  @Published var buttonDisabled: Bool = true
  @Published var tapAgree: Bool = false
  @Published var isValidEmail: Bool = false
  @Published var checkPassword: String = ""
  @Published var checkEmptyString: String = ""
  @Published var answerServer: String = ""
  @Published var checkBirthDate: String = ""

  private let coordinator: RegistrationCoordinator
  private let apiManager = ApiManager()

  func postRegistration() -> Bool {

    if checkPasswords() && birthDay != "" && name != "" && password != "" && isValidEmail == true && checkBirthay() >= 18 {
      apiManager.postRegistration(email: email, name: name, birthday: "\(birthDay)", phone: confirmPassword, password: password) {
        [weak self] answer in
        DispatchQueue.main.async {
          self?.answerServer = answer
        }
      }
      return true
    } else {
      checkEmptyString = "Не заполнены все данные"
      checkBirthDate = "Вам должно быть больше 18"
      return false
    }
  }

  func checkBirthay() -> Int {
    var checkBirthday = birthDay.components(separatedBy: "-")
    var number: Int = (Int(checkBirthday[0]) ?? 0)
    var date = Date.now.dateFormatForBirthday()
    var yearsOld = (Int(date) ?? 0) - number
    return yearsOld
  }

  func checkPasswords() -> Bool {
    if password == confirmPassword {
      checkPassword = ""
      return true
    } else {
      checkPassword = "Пароли не совпадают"
      return false
    }
  }
}
