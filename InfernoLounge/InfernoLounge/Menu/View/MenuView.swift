//
//  MenuView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 29.10.23.
//

import SwiftUI

struct MenuView: View {

  @StateObject var viewModel: MenuViewModel
  var body: some View {
    ZStack {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
        VStack(alignment: .leading) {
          TopView()
          MarkText("Меню", size: 25, weight: .bold)
            .foregroundColor(.white)
            .padding(.leading)
          HStack(spacing: 11) {
            ForEach(CategoriesMenu.allCases, id: \.self) { category in
              Button(action: {
                viewModel.selectedMenuCategory = category.rawValue
              }, label: {
                MenuCategoriesView(isActive: viewModel.selectedMenuCategory == category.rawValue, tapImageName: category.tapImageName, imageName: category.imageName, name: category.name)
                  .environmentObject(viewModel)
                  .foregroundColor(.clear)
              })
            }
          }
          .padding([.leading, .trailing], 20)

          MarkText("Категории", size: 17, weight: .medium)
            .foregroundColor(.white)
            .padding([.top, .leading])
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 5) {
              ForEach(viewModel.tea, id: \.self) { category in
                TeaAndHookahType(isSelected: category == viewModel.selectedCategory, name: category)
                  .environmentObject(viewModel)
              }
            }
          }
          .frame(height: 33)
          .padding(.leading)
          ScrollView(.vertical) {
            MenuProduct(menuProducts: $viewModel.menuProducts)
              .padding(.top, 14)
          }
          Spacer()
        }
      }
  }
}

#Preview {
  MenuView(viewModel: MenuViewModel(coordinator: MenuCoordinator()))
}
