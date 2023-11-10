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
          OtherElement(image: "vk", text: "Соц. сети")
          OtherElement(image: "quit", text: "Выйти")
            .padding(.top, 151)
          Spacer()
        }

      }
    }
}

#Preview {
  OtherView(viewModel: OtherViewModel(coordinator: OtherCoordinator()))
}
