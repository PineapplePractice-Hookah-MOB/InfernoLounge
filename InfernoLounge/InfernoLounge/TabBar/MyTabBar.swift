//
//  TabBar.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 21.10.23.
//

import SwiftUI

struct MyTabBar: View {
  @StateObject var viewModel: TabBarViewModel

  @State var selectedTab: Int

  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $selectedTab) {
        MainView(viewModel: MainViewModel(coordinator: MainCoordinator())).tag(0)
        SaleView(viewModel: SaleViewModel(coordinator: SaleCoordinator())).tag(1)
        TableView(viewModel: TableViewModel(coordinator: TableCoordinator())).tag(2)
        MenuView(viewModel: MenuViewModel(coordinator: MenuCoordinator())).tag(3)
        OtherView(viewModel: OtherViewModel(coordinator: OtherCoordinator())).tag(4)
      }
      ZStack {
        Image("tab")
        Image("circ")
        HStack {
          ForEach(TabbedItems.allCases, id: \.self) { tab in
            Button {
//              viewModel.didTapTabBar(tab)
              selectedTab = tab.rawValue
            } label: {
              customTabItem(imageName: tab.iconName, tapImageName: tab.tapIconName, isActive: (selectedTab == tab.rawValue))
            }
          }
        }
      }
    }
  }
}

#Preview {
  MyTabBar(viewModel: TabBarViewModel(coordinator: TabBarCoordinator()), selectedTab: 0)
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
