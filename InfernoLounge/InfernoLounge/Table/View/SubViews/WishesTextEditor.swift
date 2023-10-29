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
            ZStack {
              RoundedRectangle(cornerRadius: 5)
                .stroke(.black, lineWidth: 1)
                .frame(width: 360, height: 80)
              TextEditor(text: $text)
                .frame(width: 360, height: 80)
                .lineLimit(5)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .cornerRadius(5)
            }
          }
}
