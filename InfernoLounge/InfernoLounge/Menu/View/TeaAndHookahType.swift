//
//  TeaAndHookahType.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 1.11.23.
//

import SwiftUI

struct TeaAndHookahType: View {

  @EnvironmentObject var vm: MenuViewModel
  let isSelected: Bool
  let name: String

  var body: some View {

    ZStack {
      Color(uiColor: isSelected ? UIColor.white : UIColor.dark)
          .frame(width: 111, height: 32)
          .clipShape(RoundedRectangle(cornerRadius: 1))
      MarkText(name, size: 12)
        .foregroundColor(isSelected ? .black : .white)
        .clipShape(RoundedRectangle(cornerRadius: 1))
        .frame(width: 111, height: 32)

    }
    .onTapGesture {
        vm.selectedCategory = name
    }
  }
}

#Preview {
  TeaAndHookahType(isSelected: false, name: "Черный чай")
    .environmentObject(MenuViewModel(coordinator: MenuCoordinator()))
}
