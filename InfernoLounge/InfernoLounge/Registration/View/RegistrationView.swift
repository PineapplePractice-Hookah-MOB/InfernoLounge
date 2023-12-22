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
      VStack {
        TopViewRegistration()
          .foregroundStyle(.white)
          .padding(.top, 55)
        RegistationDetails(login: $viewModel.login,
                           name: $viewModel.name,
                           dateOfBirthday: $viewModel.birthDay,
                           password: $viewModel.password,
                           confirmPassword: $viewModel.confirmPassword)
        Agree()
          .environmentObject(viewModel)
          .padding(.top, 50)
        ButtonRegistration(disabled: viewModel.buttonDisabled)
          .padding(.top, 54)
        Spacer()
      }
    }
      .ignoresSafeArea()
  }
}

#Preview {
  RegistationView(viewModel: RegistrationViewModel(coordinator: RegistrationCoordinator()))
}
