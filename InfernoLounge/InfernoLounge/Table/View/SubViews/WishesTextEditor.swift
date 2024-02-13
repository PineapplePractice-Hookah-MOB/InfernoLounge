//
//  WishesTextField.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 29.10.23.
//

import SwiftUI

struct WishesTextEditor: View {

  @Binding var text: String

    var body: some View {

      TextField("", text: $text, prompt: Text("Комментарий к брони...")
        .foregroundColor(.gray))
        .cornerRadius(5)
        .frame(height: 80)
        .multilineTextAlignment(.center)
        .foregroundColor(Color(uiColor: .white))
        .scrollContentBackground(.hidden)
        .background(Color(uiColor: .dark))
          }
}
