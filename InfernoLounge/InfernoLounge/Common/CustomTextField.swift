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

        TextField(placeHolder, text: $text)
          .frame(width: 348, height: 45)
          .multilineTextAlignment(.center)
          .overlay(
                                      Rectangle()
                                          .fill(Color.black)
                                          .frame(width: 348, height: 1)
                                      , alignment: .bottom
                                  )
      }
  }
}

