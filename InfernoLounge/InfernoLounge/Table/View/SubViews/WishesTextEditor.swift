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
              TextEditor(text: $text)
                .frame(width: 360, height: 80)
                .lineLimit(5)
                .foregroundColor(Color(uiColor: .gray))
                .cornerRadius(5)
                .scrollContentBackground(.hidden)
                .background(Color(uiColor: .dark))
          }
}
