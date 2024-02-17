//
//  PickerPeopleCountView.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 29.10.23.
//

import SwiftUI

struct PickerPeopleCountView: View {

  @EnvironmentObject var vm: TableViewModel
  @Binding var selectedOption: String
  @State var isExpanded: Bool = false
  @State var height: CGFloat = 45
  @State var showAlert: Bool = false

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color(uiColor: .dark))
      VStack(spacing: 10) {
        HStack {
          MontserratText("\(selectedOption)", size: 16)
            .foregroundColor(.white)
          Spacer()
          Image(systemName: "chevron.down")
            .foregroundColor(.white)
            .rotationEffect(.degrees(isExpanded ? -540 : 0))
            .animation(.linear, value: isExpanded)
        }
          .padding([.leading, .trailing])
          .alert("", isPresented: $showAlert) {
          Button("OK") { }
        } message: {
          MontserratText("Пожалуйста, свяжитесь с администратором для осуществления бронирования по номеру\n+7 991 167 8894", size: 15)
        }
        if isExpanded {
          ForEach(vm.peopleCount.filter({ $0 != selectedOption }), id: \.self) { count in
            HStack {
              MontserratText(count, size: 16)
                .foregroundColor(.white)
              Spacer()
            }
              .padding(.leading)
              .onTapGesture {
              selectedOption = count
              isExpanded = false
              height = 45
              if count == "6 и более человек" {
                showAlert = true
                vm.buttonDisabled = true
              } else {
                showAlert = false
                vm.buttonDisabled = false
              }
            }
          }
            .transition(.scale)
        }
      }
    }
      .onTapGesture {
      withAnimation {
        isExpanded.toggle()
        if isExpanded {
          height = CGFloat(vm.peopleCount.count * 40)
        } else {
          height = 45
        }
      }
    }
      .frame(height: height)
  }

}
