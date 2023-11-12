//
//  CustomTextField.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct CustomTextField: View {
  @State var placeHolder: String
  @Binding var text: String

  var body: some View {
    VStack(alignment: .center) {
      TextField("", text: $text, prompt: Text(placeHolder).foregroundColor(.white))
        .foregroundColor(.white)
        .frame(width: 348, height: 45)
        .multilineTextAlignment(.center)
        .overlay(
        Rectangle()
          .fill(Color.white)
          .frame(width: 348, height: 1), alignment: .bottom)
    }
  }
}

