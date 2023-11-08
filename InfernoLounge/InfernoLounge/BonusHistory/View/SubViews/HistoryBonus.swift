//
//  HistoryBonus.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 8.11.23.
//

import SwiftUI

struct HistoryBonus: View {

  @Binding var bonusHistorys: [BonusHistory]
  var body: some View {
    ScrollView {
      ForEach(bonusHistorys, id: \.id) { bonusHistory in
        ZStack {
          RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.init(uiColor: UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1)))
            .frame(width: 350, height: 55)
          HStack {
            VStack {
              MarkText(bonusHistory.date, size: 12)
                .foregroundColor(.gray)
              MarkText(bonusHistory.summ, size: 15)
                .foregroundColor(.white)
            }
            Spacer()
            VStack {
              MarkText("бонусные баллы", size: 12)
                .foregroundColor(.gray)
              if bonusHistory.countBonus.contains("+") {
                MarkText(bonusHistory.countBonus, size: 15)
                  .foregroundColor(.green)
              } else {
                MarkText(bonusHistory.countBonus, size: 15)
                  .foregroundColor(.red)
              }
            }
          }
          .padding([.trailing, .leading], 50)
        }
      }
    }
  }
}

//#Preview {
//    HistoryBonus()
//}
