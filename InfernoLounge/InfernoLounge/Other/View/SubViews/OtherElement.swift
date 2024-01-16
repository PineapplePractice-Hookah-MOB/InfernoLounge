//
//  OtherElement.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

struct OtherElement: View {

  @State var image: String
  @State var text: String

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .frame(height: 46)
        .foregroundColor(.init(uiColor: .dark))
      HStack {
        MontserratText(text, size: 14, weight: .medium)
          .foregroundColor(.white)
        Spacer()
        Image(image)
      }
        .padding([.trailing, .leading], 40)
    }
      .padding([.trailing, .leading])
  }
}

#Preview {
  OtherElement(image: "mail", text: "Оставьте отзыв")
}
