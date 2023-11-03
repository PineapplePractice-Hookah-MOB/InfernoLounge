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
      Color(uiColor: isSelected ? UIColor(.black) : UIColor.white)
          .frame(width: 111, height: 32)
          .clipShape(RoundedRectangle(cornerRadius: 1))
      MarkText(name, size: 12)
        .clipShape(RoundedRectangle(cornerRadius: 1))
        .frame(width: 111, height: 32)
        .border(.black, width: 1)
        .foregroundColor(isSelected ? .white : .black)
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
