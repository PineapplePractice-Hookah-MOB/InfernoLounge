//
//  RegistrationView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct RegistationView: View {

  @ObservedObject var vm: RegistrationViewModel

  var body: some View {
    VStack {
      Image("лого")
        .padding(.top, 36)

      MarkText("Вход", size: 25)
        .font(.system(size: 25, weight: .bold))
        .padding(.top, 50)
      MarkText("Введите имя и дату вашего рождения", size: 16)
        .font(.system(size: 16))
        .padding([.trailing, .leading], 94)
        .padding(.top, 10)
        .multilineTextAlignment(.center)
      CustomTextField(placeHolder: "Введите ваше имя", text: vm.name)
        .padding(.top, 65)
      CustomTextField(placeHolder: "Введите дату рождения", text: vm.birthDay)
        .padding(.top, 30)
      Spacer()
        Button(action: {
          vm.main()
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

#Preview {
  RegistationView(vm: RegistrationViewModel(coordinator: RegistrationCoordinator()))
}
