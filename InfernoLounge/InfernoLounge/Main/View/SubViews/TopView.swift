//
//  TopView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct TopView: View {

  var name: String
  var body: some View {
      HStack {
        Image("logo")
        Spacer()
        VStack {
          Image("profile")
          MontserratText(name, size: 17, weight: .medium)
            .foregroundColor(.white)
            .overlay {
              if name == "" {
                ProgressView()
              }
            }
        }
      }
      .padding()
    }
}

#Preview {
  TopView(name: "Андрей")
}
