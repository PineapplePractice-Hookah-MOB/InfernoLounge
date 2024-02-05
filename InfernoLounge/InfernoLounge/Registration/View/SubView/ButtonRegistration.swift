//
//  ButtonRegistration.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import SwiftUI

struct ButtonRegistration: View {

  @Environment(\.dismiss) var dismiss
  let disabled: Bool
  var function: () -> Bool
  @State var showAlert: Bool = false
  var answerServer: String
  var checkEmptyString: String

  var body: some View {
    Button(action: {
      if function() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: {
          dismiss.callAsFunction()
          showAlert.toggle()
        }))
      } else {
        showAlert.toggle()
      }
    }, label: {
        MontserratText("Далее", size: 16)
          .foregroundColor(.white)
          .font(.system(size: 16, weight: .bold))
      })
      .frame(width: 278, height: 72)
      .background {
      RoundedRectangle(cornerRadius: 5)
        .stroke()
        .foregroundStyle(.white)
      Spacer()
      HStack {
        Image("left")
          .padding(.top, 40)
        Spacer()
        Image("right")
          .padding(.bottom, 40)
      }
        .padding(-5)
      Spacer()
    }
      .disabled(disabled)
      .alert("", isPresented: $showAlert) {
      Button("OK") { 
        showAlert = false
      }
    } message: {
      if answerServer == "" {
        MontserratText(checkEmptyString, size: 15)
      } else {
        MontserratText(answerServer, size: 15)
      }
    }
  }
}

