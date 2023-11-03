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
        .frame(width: 170, height: 77)
        .border(.black, width: 1)
        .background(isActive ? .black : .white)
      HStack(spacing: 14) {
        MarkText(name, size: 20, weight: .medium)
          .foregroundStyle(isActive ? .white : .black)
        Image(isActive ? tapImageName : imageName)
      }
    }
  }
}

#Preview {
  MenuCategoriesView(isActive: true, tapImageName: "tapЧай", imageName: "Чай", name: "Чай")
}
