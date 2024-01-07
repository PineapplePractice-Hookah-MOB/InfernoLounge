//
//  TableReservation.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import Foundation

struct CreateBooking: Encodable {

  let tableId: Int
  let people: Int
  let comment: String
  let bookedFrom: String
  let bookedTill: String
}
