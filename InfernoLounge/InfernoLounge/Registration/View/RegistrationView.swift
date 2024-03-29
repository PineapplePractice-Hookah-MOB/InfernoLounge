//
//  RegistrationView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct RegistationView: View {

  @StateObject var viewModel: RegistrationViewModel

  var body: some View {
    ZStack(alignment: .bottom) {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
      Image("Smokemini")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.bottom, -50)
      VStack {
        TopViewRegistration()
          .foregroundStyle(.white)
          .padding(.top, 55)
        RegistationDetails(email: $viewModel.email,
          name: $viewModel.name,
          dateOfBirthday: $viewModel.birthDay,
          password: $viewModel.password,
          confirmPassword: $viewModel.confirmPassword, isEmailValid: $viewModel.isValidEmail, text: viewModel.checkPassword, checkBirthday: viewModel.checkBirthDate)
          .padding([.trailing, .leading])
        Agree()
          .environmentObject(viewModel)
          .padding(.top, 50)
        ButtonRegistration(disabled: viewModel.buttonDisabled, function: viewModel.postRegistration, answerServer: viewModel.answerServer, checkEmptyString: viewModel.checkEmptyString)
          .padding(.top, 54)
        Spacer()
      }
    }
      .ignoresSafeArea(.all)
  }
}

#Preview {
  RegistationView(viewModel: RegistrationViewModel(coordinator: RegistrationCoordinator()))
}
