//
//  MenuViewModel.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 29.10.23.
//

import SwiftUI


final class MenuViewModel: ObservableObject {
  init(coordinator: MenuCoordinator) {
    self.coordinator = coordinator
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: DispatchWorkItem(block: {
        self.user = SinletonUser.shared.user
        print(self.user)
      }))
  }

  private let coordinator: MenuCoordinator

  @Published var tea = ["Все", "Черный чай", "Зеленый чай", "Улуны", "Фруктовый чай"]
  @Published var hookah = ["Все", "Экстра", "Легкий", "Медиум"]
  @Published var selectedMenuCategory = 0
  @Published var selectedCategoryTea: String = "Все"
  @Published var selectedCategoryHookah: String = "Все"
  @Published var selectegCategory = "Все"
  @Published var user = User()

  @Published var menuProducts: [MenuProducts] = [MenuProducts(id: 1, image: "Белый храм", name: "Белый храм", taste: "с бергамотов", size: "600мл", price: "150p.", type: "Зеленый чай"),
    MenuProducts(id: 2, image: "Пика дама", name: "Пика дама", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Черный чай"),
    MenuProducts(id: 3, image: "Липовый мед", name: "Липовый мед", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Фруктовый чай"),
    MenuProducts(id: 4, image: "Граф грей", name: "Граф грей", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Черный чай"),
    MenuProducts(id: 5, image: nil, name: "Черный", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Черный чай"),
    MenuProducts(id: 6, image: nil, name: "Черный", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Черный чай"),
    MenuProducts(id: 7, image: nil, name: "Черный", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Черный чай"),
    MenuProducts(id: 8, image: nil, name: "Фруктовый", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Фруктовый чай"),
    MenuProducts(id: 9, image: nil, name: "Улун", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Улуны"),
    MenuProducts(id: 10, image: nil, name: "Зеленый", taste: "с бергамотом", size: "600мл", price: "150p.", type: "Зеленый чай"),
    MenuProducts(id: 11, image: nil, name: "Кальян", taste: "на яблоке", size: nil, price: "1500p.", type: "Экстра"),
    MenuProducts(id: 12, image: nil, name: "Кальян", taste: "на вине", size: nil, price: "1500р.", type: "Легкий"),
    MenuProducts(id: 13, image: nil, name: "Кальян", taste: "на воде", size: nil, price: "1500р.", type: "Медиум")
  ]
  var teaProducts: [MenuProducts] { menuProducts.filter { $0.size != nil } }
  var hookahs: [MenuProducts] { menuProducts.filter { $0.size == nil } }

  var filteredTeaProductsType: [MenuProducts] {
    selectedCategoryTea == "Все" ? teaProducts : menuProducts.filter { $0.type == selectedCategoryTea }
  }
  var filteredTeaProductsHookah: [MenuProducts] {
    selectedCategoryHookah == "Все" ? hookahs : menuProducts.filter { $0.type == selectedCategoryHookah }
  }
}
