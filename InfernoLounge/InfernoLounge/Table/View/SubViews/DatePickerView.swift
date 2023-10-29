//
//  DatePicker.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.10.23.
//

import SwiftUI

struct DatePickerView: View {

  @Binding var date: Date
  @State private var isShowCalendar = false
  @State var height: CGFloat = 45

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .stroke(.black, lineWidth: 1)
      VStack(spacing: 10, content: {
        HStack {
          MarkText("\(date.formatted(date: .numeric, time: .shortened))", size: 15)
            
          Spacer()
          Image(systemName: "chevron.down")
            .rotationEffect(.degrees(isShowCalendar ? -540 : 0))
            .animation(.linear, value: isShowCalendar)
        }
        .padding([.leading, .trailing])
        if isShowCalendar {
              DatePicker("",
                         selection: $date, displayedComponents: [.date, .hourAndMinute])
              .datePickerStyle(GraphicalDatePickerStyle())
        }
      })
    }
    .onTapGesture {
      withAnimation {
        isShowCalendar.toggle()
        if isShowCalendar {
          height = 400
        } else {
          height = 45
        }
      }
    }
    .frame(height: height)
  }
}
