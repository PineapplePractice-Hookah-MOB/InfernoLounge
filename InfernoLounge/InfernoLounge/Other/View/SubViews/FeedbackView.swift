//
//  FeedbackView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 14.01.24.
//

import SwiftUI

struct FeedbackView: View {

  @Environment(\.dismiss) var dismiss
  @Binding var feedback: String
  var postFunction: () -> ()

  var body: some View {
    ZStack {
      Color(.darkBackground)
        .ignoresSafeArea()
      VStack {
        Spacer()
        TextField("", text: $feedback, prompt: Text("Напишите отзыв...")
            .foregroundColor(.gray))
          .cornerRadius(5)
          .frame(height: 80)
          .multilineTextAlignment(.center)
          .foregroundColor(Color(uiColor: .white))
          .scrollContentBackground(.hidden)
          .background(Color(uiColor: .dark))
        Spacer()
        Button(action: {
          dismiss.callAsFunction()
          postFunction()
        }, label: {
            MontserratText("Забронировать", size: 16)
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
          .padding([.bottom], 60)
      }
    }
  }
}
