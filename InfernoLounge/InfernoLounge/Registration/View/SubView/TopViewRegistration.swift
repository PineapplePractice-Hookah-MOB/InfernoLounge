//
//  TopViewRegistration.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import SwiftUI

struct TopViewRegistration: View {
    var body: some View {
      HStack {
        MontserratText("Регистрация", size: 25, weight: .bold)
        Spacer()
        Image("logo")
      }
      .padding([.trailing, .leading], 20)
    }
}

#Preview {
    TopViewRegistration()
}
