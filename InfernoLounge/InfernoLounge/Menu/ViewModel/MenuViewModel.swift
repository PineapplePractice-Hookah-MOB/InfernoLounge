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
  }

  private let coordinator: MenuCoordinator

  @Published var tea = ["Черный чай", "Зеленый чай", "Улуны", "Фруктовый чай"]
  @Published var hookah = [""]

  @Published var menuProducts: [MenuProducts] = [MenuProducts(id: 1, image: nil, name: "Белый храм", taste: "с бергамотов", size: "600мл", price: "150p."),
                                                 MenuProducts(id: 2, image: nil, name: "Белый храм", taste: "с бергамотов", size: "600мл", price: "150p."),
                                                 MenuProducts(id: 3, image: nil, name: "Белый храм", taste: "с бергамотов", size: "600мл", price: "150p."),
                                                 MenuProducts(id: 4, image: nil, name: "Белый храм", taste: "с бергамотов", size: "600мл", price: "150p."),
                                                 MenuProducts(id: 5, image: nil, name: "Белый храм", taste: "с бергамотов", size: "600мл", price: "150p.")]

        @Published var selectedMenuCategory = 0
        @Published var selectedCategory: String = "Черный чай"
      }
