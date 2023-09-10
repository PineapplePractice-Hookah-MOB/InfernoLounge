//
//  LoginView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 10.09.23.
//

import SwiftUI

struct LoginView: View {

  @ObservedObject var viewModel: LoginViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
      LoginView(viewModel: LoginViewModel(coordinator: LoginCoordinator()))
    }
}
