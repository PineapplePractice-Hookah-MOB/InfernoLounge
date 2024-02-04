//
//  TableReservation.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import Foundation

struct TableReservation: Decodable {
  let bookingId: Int
  let tableId: Int
  let people: Int
  let comment: String
  let bookedFrom: String
  let bookedTill: String

  init() {
    self.bookingId = 0
    self.tableId = 0
    self.people = 0
    self.comment = ""
    self.bookedFrom = ""
    self.bookedTill = ""
  }
}

