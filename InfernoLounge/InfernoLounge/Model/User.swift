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
  let birthday: [Int]
  let groupIds: JSONNull?
  let points: Int?

  enum CodingKeys: String, CodingKey {
    case id, email, login, name, phone, comment, card, birthday
    case groupIds
    case points
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Int.self, forKey: .id)
    self.email = try container.decode(String.self, forKey: .email)
    self.name = try container.decode(String?.self, forKey: .name)
    self.phone = try container.decode(String?.self, forKey: .phone)
    self.comment = try container.decode(String?.self, forKey: .comment)
    self.card = try container.decode(String?.self, forKey: .card)
    self.login = try container.decode(String.self, forKey: .login)
    self.birthday = try container.decode([Int].self, forKey: .birthday)
    self.groupIds = try container.decode(JSONNull?.self, forKey: .groupIds)
    self.points = try container.decode(Int?.self, forKey: .points)
  }

  init() {
    self.id = 0
    self.email = ""
    self.name = ""
    self.phone = ""
    self.comment = ""
    self.card = ""
    self.login = ""
    self.birthday = []
    self.groupIds = JSONNull()
    self.points = 0

  }
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
