//
//  TeaAndHookahType.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 1.11.23.
//

import SwiftUI

struct TeaAndHookahType: View {

  let isSelected: Bool
  let name: String
  var onChangeMenuType: (String) -> ()

  var body: some View {

    ZStack {
      Color(isSelected ? .white : .dark)
        .frame(width: 111, height: 32)
        .clipShape(RoundedRectangle(cornerRadius: 1))
      MontserratText(name, size: 12)
        .foregroundColor(isSelected ? .black : .white)
        .clipShape(RoundedRectangle(cornerRadius: 1))
        .frame(width: 111, height: 32)

    }
      .onTapGesture {
      onChangeMenuType(name)
    }
  }
}

#Preview {
  TeaAndHookahType(isSelected: false, name: "Черный чай") { _ in }
}
