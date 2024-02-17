//
//  JWT.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 17.01.24.
//

import Foundation

struct JWT {
  let header: [String: Any]?
  let payload: Payload?
  let signature: String?

  static func decodeJWT(token: String) -> Self? {
    func base64StringWithPadding(encodedString: String) -> String {
      var stringTobeEncoded = encodedString.replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")
      let paddingCount = encodedString.count % 4
      for _ in 0..<paddingCount {
        stringTobeEncoded += "="
      }
      return stringTobeEncoded
    }
    func decodeJWTPart(part: String) -> [String: Any]? {
      let payloadPaddingString = base64StringWithPadding(encodedString: part)
      guard let payloadData = Data(base64Encoded: payloadPaddingString)
        else {
        return nil
      }
      return try? JSONSerialization.jsonObject(
        with: payloadData,
        options: []) as? [String: Any]
    }

    let parts = token.components(separatedBy: ".")

    guard parts.count == 3 else { return nil }
    let jwt = parts.map { decodeJWTPart(part: $0) }

    let header = jwt[0]
    var payload: Payload?
    let signature = String(describing: jwt[2])

    if let payloadDict = jwt[1],
      let data = try? JSONSerialization.data(withJSONObject: payloadDict) {
      let p = try? JSONDecoder().decode(Payload.self, from: data)
      payload = p
    }


    return Self(header: header, payload: payload, signature: signature)
  }
}

struct Payload: Decodable {
  let id: Int
  let sub: String
  let iat: Int
  let exp: Int
}

struct Header: Decodable {
  let alg: String
}
