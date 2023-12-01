//
//  Agree.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.11.23.
//

import SwiftUI

struct Agree: View {

  @EnvironmentObject var vm: RegistrationViewModel
//  @State var isTap: Bool
//  @State var buttonDisabled: Bool
  var body: some View {
    ZStack {
      HStack {
        Button {
          vm.tapAgree.toggle()
          vm.buttonDisabled.toggle()
        } label: {
          ZStack {
            Image(systemName: vm.tapAgree ? "checkmark" : "")
              .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 0)
              .stroke(.white, lineWidth: 1)
              .frame(width: 25, height: 25)
              .foregroundColor(.clear)
          }
        }
        MarkText("Я согласен на обработку персональных данных", size: 12, weight: .medium)
          .foregroundColor(.white)
      }
    }
  }
}
