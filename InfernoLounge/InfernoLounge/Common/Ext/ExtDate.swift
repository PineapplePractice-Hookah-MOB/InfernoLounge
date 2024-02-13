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
    formatter.dateFormat = "YYYY-MM-dd HH:00:00"
    return formatter.string(from: self)
  }

  func dateFormatForBirthday() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY"
    return formatter.string(from: self)
  }
}
