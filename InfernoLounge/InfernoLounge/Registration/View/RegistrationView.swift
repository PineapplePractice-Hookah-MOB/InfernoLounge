//
//  RegistrationView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct RegistationView: View {

  @StateObject var vm: RegistrationViewModel



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
        MarkText("Введите имя и дату вашего рождения", size: 16)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding([.trailing, .leading], 94)
          .padding(.top, 10)

        CustomTextField(placeHolder: "Введите ваше имя", text: $vm.name)
          .padding(.top, 25)

        CustomTextField(placeHolder: "Введите дату рождения", text: $vm.birthDay)
          .padding(.top, 20)

        Agree(isTap: false)
          .padding(.top, 50)

        Button(action: {
          vm.main()
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
          .padding(.top, 54)
        Spacer()
      }
    }
      .ignoresSafeArea()
  }
}

#Preview {
  RegistationView(vm: RegistrationViewModel(coordinator: RegistrationCoordinator()))
}
