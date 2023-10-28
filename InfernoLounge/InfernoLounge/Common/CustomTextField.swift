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
      ZStack {
        RoundedRectangle(cornerRadius: 15)
          .stroke(.black, lineWidth: 1)
          .foregroundColor(.white)
          .frame(width: 360, height: 45)
        TextField(placeHolder, text: $text)
          .frame(width: 360, height: 45)
          .multilineTextAlignment(.center)
      }
    }
  }
}

