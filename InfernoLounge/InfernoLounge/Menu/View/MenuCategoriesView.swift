//
//  MenuCategoriesView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 29.10.23.
//

import SwiftUI

struct MenuCategoriesView: View {

  @EnvironmentObject var vm: MenuViewModel
  let isActive: Bool
  let tapImageName: String
  let imageName: String
  let name: String

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 1)
        .frame(height: 77)
        .background(isActive ? .white : Color(uiColor: .dark))
      HStack(spacing: 14) {
        MontserratText(name, size: 20, weight: .medium)
          .foregroundColor(isActive ? .black : .white)
        Image(isActive ? tapImageName : imageName)
      }
    }
  }
}

#Preview {
  MenuCategoriesView(isActive: true, tapImageName: "tapЧай", imageName: "Чай", name: "Чай")
}
