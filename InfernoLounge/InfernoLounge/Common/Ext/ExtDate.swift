//
//  ExtDate.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 7.01.24.
//

import Foundation

extension Date {

  func dateFormat() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
    return formatter.string(from: self)
  }
}
