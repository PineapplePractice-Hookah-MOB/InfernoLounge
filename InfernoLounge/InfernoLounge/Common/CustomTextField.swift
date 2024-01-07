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
      TextField("", text: $text, prompt: Text(placeHolder).foregroundColor(.gray))
        .foregroundColor(.white)
        .frame(height: 45)
        .multilineTextAlignment(.leading)
        .overlay(
        Rectangle()
          .fill(Color.white)
          .frame(height: 1), alignment: .bottom)
    }
  }
}

