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
          .frame(width: 350, height: 46)
          .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))

        HStack {
          MontserratText(text, size: 14, weight: .medium)
            .foregroundColor(.white)
          Spacer()
          Image(image)
        }
        .padding([.trailing, .leading], 40)
      }
    }
}

#Preview {
  OtherElement(image: "mail", text: "Оставьте отзыв")
}
