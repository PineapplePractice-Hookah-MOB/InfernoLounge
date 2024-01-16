//
//  DatePicker.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.10.23.
//

import SwiftUI

struct DatePickerView: View {

  @Environment(\.dismiss) var dismiss
  @Binding var date: Date

  var body: some View {
    ZStack {
      Color(uiColor: .darkBackground)
      VStack {
        DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
          .datePickerStyle(.graphical)
          .background(Color(uiColor: .dark))
          .colorInvert()
          .accentColor(.white)
        Button(action: {
          dismiss()
        }, label: {
              MontserratText("Подтвердить", size: 16)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
          })
        .frame(width: 278)
          .background {
            RoundedRectangle(cornerRadius: 5)
              .stroke()
              .foregroundStyle(.gray)
          Spacer()
          HStack {
            Image("left")
              .padding(.top, 40)
            Spacer()
            Image("right")
              .padding(.bottom, 40)
          }
            .padding(-5)
          Spacer()
        }
        .padding(.top, 50)
      }
    }
  }
}
