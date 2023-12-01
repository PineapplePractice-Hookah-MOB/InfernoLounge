//
//  OtherView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 3.11.23.
//

import SwiftUI

struct OtherView: View {

  @StateObject var viewModel: OtherViewModel

  var body: some View {
    ZStack {
      Color(uiColor: UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1))
        .edgesIgnoringSafeArea(.all)
      VStack {
        Image("wlogo")
        ProfileAndPoinView()
          .padding(.top, 30)
        OtherElement(image: "mail", text: "Оставьте отзыв")
        OtherElement(image: "phone", text: "Контакты")
        OtherElement(image: "quit", text: "Выйти")
        Spacer()
        MarkText("Мы в соц. сетях", size: 14, weight: .medium)
          .foregroundColor(.white)
          .padding(.bottom, 20)
        HStack(spacing: 56) {
          Image("vko")
          Image("insta")
          Image("fb")
        }
          .padding(.bottom, 109)
      }
    }
  }
}

#Preview {
  OtherView(viewModel: OtherViewModel(coordinator: OtherCoordinator()))
}
