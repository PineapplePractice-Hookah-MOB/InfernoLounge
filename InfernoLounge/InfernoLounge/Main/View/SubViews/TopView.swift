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
          MontserratText("Андрей", size: 17, weight: .medium)
            .foregroundColor(.white)
        }
      }
      .padding()
    }
}

#Preview {
  TopView()
}
