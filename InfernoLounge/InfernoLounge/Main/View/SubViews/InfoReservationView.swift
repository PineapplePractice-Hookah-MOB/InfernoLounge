//
//  InfoReservationView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.01.24.
//

import SwiftUI

struct InfoReservationView: View {
  var text: String
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .foregroundStyle(Color(uiColor: text == "" ? .clear : .dark))
        .frame(height: 56)
      MontserratText(text, size: 15)
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .padding([.trailing, .leading], 20)
    }
  }
}

#Preview {
  InfoReservationView(text: "У вас забронирован столик                          2024-01-28 15:00:00")
}
