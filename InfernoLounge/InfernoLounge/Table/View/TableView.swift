//
//  TableView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 28.10.23.
//

import SwiftUI

struct TableView: View {


  @StateObject var viewModel: TableViewModel
  @State var date = Date.self

  var body: some View {
    ZStack {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
      VStack {
        VStack(alignment: .leading) {
          TopView()
          MarkText("Забронировать столик", size: 25, weight: .bold)
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.leading)
          MarkText("Дата и Время", size: 16, weight: .heavy)
            .foregroundColor(.white)
            .padding(.leading)
            .padding(.top, 30)
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
              .foregroundColor(Color(uiColor: .dark))
            HStack {
              Image("date")
              MarkText("\(viewModel.selectedDate.formatted(date: .numeric, time: .shortened))", size: 15)
                .foregroundColor(.white)
              Spacer()
              Image(systemName: "chevron.down")
                .foregroundColor(.white)
            }
            .padding([.trailing, .leading])
          }
          .onTapGesture {
            viewModel.datePickerSheetPresenting = true
          }
          .sheet(isPresented: $viewModel.datePickerSheetPresenting, content: {
            DatePickerView(date: $viewModel.selectedDate)
          })
          .frame(height: 45)
          .padding([.trailing, .leading])
          .sheet(isPresented: $viewModel.datePickerSheetPresenting, content: {
            DatePickerView(date: $viewModel.selectedDate)
          })
          MarkText("Количество гостей", size: 16, weight: .heavy)
            .foregroundColor(.white)
            .padding([.trailing, .leading, .top])

          PickerPeopleCountView(selectedOption: $viewModel.count)
            .environmentObject(viewModel)
            .padding([.trailing, .leading])
          MarkText("Пожелания", size: 16, weight: .heavy)
            .foregroundColor(.white)
            .padding([.trailing, .leading, .top])
          WishesTextEditor(text: $viewModel.wishes)
            .padding([.leading])
          Spacer()
        }
        Button(action: {
        }, label: {
          ZStack {
            HStack {
              Image("left")
                .padding(.top, 40)
                .padding(.leading, 52)
              Spacer()
              Image("right")
                .padding(.bottom, 40)
                .padding(.trailing, 52)
            }
            RoundedRectangle(cornerRadius: 5)
              .stroke(.white, lineWidth: 1)
              .foregroundColor(.clear)
              .frame(width: 278, height: 72)
            MarkText("Забронировать", size: 16)
              .foregroundColor(.white)
              .font(.system(size: 16, weight: .bold))
          }
        })
        .padding([.bottom], 60)
      }
    }
  }
}

#Preview {
  TableView(viewModel: TableViewModel(coordinator: TableCoordinator()))
}

