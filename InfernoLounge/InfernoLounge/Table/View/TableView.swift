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
  @State var buttonDisabled = false
  @State var showAlert = false

  var body: some View {
    ZStack {
      Color(uiColor: .darkBackground)
        .ignoresSafeArea()
      VStack {
        VStack(alignment: .leading) {
          TopView(name: viewModel.user.login)
          MontserratText("Забронировать столик", size: 25, weight: .bold)
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.leading)
          MontserratText("Дата и Время", size: 16, weight: .heavy)
            .foregroundColor(.white)
            .padding(.leading)
            .padding(.top, 30)
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
              .foregroundColor(Color(uiColor: .dark))
            HStack {
              Image("date")
              MontserratText("\(viewModel.selectedDate.formatted(date: .numeric, time: .shortened))", size: 15)
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
          MontserratText("Количество гостей", size: 16, weight: .heavy)
            .foregroundColor(.white)
            .padding([.trailing, .leading, .top])

          PickerPeopleCountView(selectedOption: $viewModel.count)
            .environmentObject(viewModel)
            .padding([.trailing, .leading])
          MontserratText("Пожелания", size: 16, weight: .heavy)
            .foregroundColor(.white)
            .padding([.leading, .top])
          WishesTextEditor(text: $viewModel.wishes)
            .padding([.leading, .trailing])
          Spacer()
        }
        Button(action: {
          viewModel.postTable()
          DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
            showAlert.toggle()
          }))
        }, label: {
            MontserratText("Забронировать", size: 16)
              .foregroundColor(buttonDisabled == false ? .white : .gray)
              .font(.system(size: 16, weight: .bold))
          })
          .frame(width: 278)
          .background {
          buttonDisabled == false ? RoundedRectangle(cornerRadius: 5)
            .stroke()
            .foregroundStyle(.white): RoundedRectangle(cornerRadius: 5)
            .stroke()
            .foregroundStyle(.gray)
          Spacer()
          HStack {
            Image("left")
              .padding(.top, 40)
            Spacer()
            Image("right")
              .padding(.bottom, 40)
          }
            .padding(-5)
          Spacer()
        }
          .padding([.bottom], 60)
          .disabled(viewModel.buttonDisabled)
          .alert("", isPresented: $showAlert) {
            Button("OK") { }
          } message: {
            MontserratText(viewModel.answerServer, size: 15)
          }
      }
    }
  }
}

#Preview {
  TableView(viewModel: TableViewModel(coordinator: TableCoordinator()))
}

