//
//  Token.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 16.01.24.
//

import Foundation

struct Token: Codable {
  let accessToken, refreshToken: String

  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case refreshToken = "refresh_token"
  }
}
