//
//  OtherView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI

struct OtherView: View {

  @StateObject var viewModel: OtherViewModel
  @Environment(\.openURL) var openURL
  @Environment(\.dismiss) var dismiss
  @State private var sheetShown = false

  var body: some View {
    ZStack {
      Color(uiColor: UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1))
        .edgesIgnoringSafeArea(.all)
      VStack {
        Image("wlogo")
        ProfileAndPoinView(name: viewModel.user.login)
          .padding(.top, 30)
        OtherElement(image: "mail", text: "Оставьте отзыв")
          .onTapGesture {
          viewModel.isPresenting = true

        }
          .sheet(isPresented: $viewModel.isPresenting, content: {
          FeedbackView(feedback: $viewModel.feedback, postFunction: viewModel.postFeedback, answer: viewModel.answer)
        })
        OtherElement(image: "phone", text: "Контакты")
          .onTapGesture {
          viewModel.makeAPhoneCall()
        }
        OtherElement(image: "quit", text: "Выйти")
          .onTapGesture {
          dismiss.callAsFunction()
        }
        Spacer()
        MontserratText("Мы в соц. сетях", size: 14, weight: .medium)
          .foregroundColor(.white)
          .padding(.bottom, 20)
        HStack(spacing: 56) {
          Button {
            openURL(URL(string: "https://vk.com/inferno_arh")!)
          } label: {
            Image("vko")
          }
          Image("insta")
            .onTapGesture {
            openURL(URL(string: "https://www.instagram.com/inferno_arh/")!)
          }
          Image("fb")
            .onTapGesture {
            openURL(URL(string: "https://www.facebook.com/inferno.hookah.bar/")!)
          }
        }
          .padding(.bottom, 109)
      }
    }
  }
}

#Preview {
  OtherView(viewModel: OtherViewModel(coordinator: OtherCoordinator()))
}
