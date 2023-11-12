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

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color(uiColor: .dark))
      VStack(spacing: 10) {
        HStack {
          MarkText("\(selectedOption)" , size: 16)
            .foregroundColor(.white)
          Spacer()
          Image(systemName: "chevron.down")
            .foregroundColor(.white)
            .rotationEffect(.degrees(isExpanded ? -540 : 0))
            .animation(.linear, value: isExpanded)
        }
        .padding([.leading, .trailing])

        if isExpanded {
          ForEach(vm.peopleCount.filter({$0 != selectedOption}), id: \.self) { count in
            HStack {
                MarkText(count, size: 16)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.leading)
            .onTapGesture {
              selectedOption = count
              isExpanded = false
              height = 45
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
