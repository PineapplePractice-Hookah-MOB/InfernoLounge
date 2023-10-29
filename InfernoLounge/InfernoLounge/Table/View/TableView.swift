//
//  TableView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.10.23.
//

import SwiftUI

struct TableView: View {


  @StateObject var viewModel: TableViewModel
  
    var body: some View {
      VStack {
        VStack(alignment: .leading) {
          TopView()
          MarkText("Забронировать столик", size: 25, weight: .bold)
            .padding()
          MarkText("Дата и Время", size: 16)
            .padding(.leading)
          DatePickerView(date: $viewModel.date)
            .padding([.leading, .trailing ])
          MarkText("Количество гостей", size: 16)
            .padding([.trailing, .leading, .top])

          PickerPeopleCountView(selectedOption: $viewModel.count)
            .environmentObject(viewModel)
            .padding([.trailing, .leading])
          MarkText("Пожелания", size: 16)
            .padding([.trailing, .leading, .top])
          WishesTextEditor(text: $viewModel.wishes)
            .padding([.leading])
          Spacer()

        }
        Button(action: {

        }, label: {
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.black, lineWidth: 1)
              .foregroundColor(.white)
              .frame(width: 278, height: 72)
            MarkText("Забронировать", size: 16)
              .foregroundColor(.black)
          }
        })
        .padding([.bottom], 60)

        }
      MyTabBar(selectedTab: 2)
        .environmentObject(MainViewModel(coordinator: MainCoordinator()))
    }
}

#Preview {
  TableView(viewModel: TableViewModel(coordinator: TableCoordinator()))
}
