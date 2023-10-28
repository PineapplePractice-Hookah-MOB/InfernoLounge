//
//  TabBar.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
  case home = 0
  case sale
  case table
  case menu
  case others

  var iconName: String {
    switch self {
    case .home:
      return "home"
    case .sale:
      return "sale"
    case .table:
      return "table"
    case .menu:
      return "menu"
    case .others:
      return "others"
    }
  }
  var tapIconName: String {
    switch self {
    case .home:
      return "tapMain"
    case .sale:
      return "tapSale"
    case .table:
      return "tapTable"
    case .menu:
      return "tapMenu"
    case .others:
      return "tapOther"
    }
  }

}

struct MyTabBar: View {
  @EnvironmentObject var viewModel: MainViewModel

  let tabs = TabbedItems.allCases
  @State var selectedTab: Int

  var body: some View {
    ZStack {
      Image("tab")
      Image("circ")
      HStack {
        ForEach(TabbedItems.allCases, id: \.self) { tab in
          Button {
            viewModel.didTapTabBar(tab)
          } label: {
            customTabItem(imageName: tab.iconName, tapImageName: tab.tapIconName, isActive: (selectedTab == tab.rawValue))
          }
        }
      }
    }
  }
}

#Preview {
  MyTabBar(selectedTab: 0)
    .environmentObject(MainViewModel(coordinator: MainCoordinator()))
}

extension MyTabBar {
  func customTabItem(imageName: String, tapImageName: String, isActive: Bool) -> some View {
    HStack(spacing: 5) {
      Spacer()
      if isActive {
        Image(tapImageName)
      } else {
        Image(imageName)
      }
      Spacer()
    }
  }
}
