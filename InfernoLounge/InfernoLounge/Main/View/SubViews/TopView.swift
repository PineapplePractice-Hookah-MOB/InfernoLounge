//
//  TopView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct TopView: View {
  var body: some View {
    HStack {
      Image("logo")
      Spacer()
      VStack {
        Image("profile")
        MarkText("Андрей", size: 17)
      }
    }
      .padding()
  }
}

#Preview {
  TopView()
}
