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
            ZStack {
              HStack {
                Image("left")
                  .padding(.top, 40)
                  .padding(.leading, 52)
                Spacer()
                Image("right")
                  .padding(.bottom, 40)
                  .padding(.trailing, 52)
              }
              RoundedRectangle(cornerRadius: 5)
                .stroke(.white, lineWidth: 1)
                .foregroundColor(.clear)
                .frame(width: 278, height: 72)
              MarkText("Подтвердить", size: 16)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
            }
          })
        .padding(.top, 50)
      }
    }
  }
}
