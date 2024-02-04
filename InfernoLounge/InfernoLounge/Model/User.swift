//
//  Login.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 7.01.24.
//

import Foundation

struct User: Decodable {
  let id: Int
  let email, login: String
  let name, phone, comment, card: String?
  let birthday: String
  let groupIds: Int?
  let points: Float

  init() {
    self.id = 0
    self.email = ""
    self.name = ""
    self.phone = ""
    self.comment = ""
    self.card = ""
    self.login = ""
    self.birthday = ""
    self.groupIds = 0
    self.points = 0.0

  }
}

class SinletonUser {
  static let shared = SinletonUser()
  var user: User = User()
  private init() {
  }
}
