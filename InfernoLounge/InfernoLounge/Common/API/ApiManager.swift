//
//  ApiManager.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 22.12.23.
//

import Foundation
import Combine
import Alamofire

enum ApiPath: String {
  case postTable = "http://213.219.212.47:9000/api/booking"
}

final class ApiManager {

  func post(tableId: Int, people: Int, comment: String, bookedFrom: String, bookedTill: String) {


    let parameters = "{\n    \"tableId\": \(tableId),\n    \"people\": \(people),\n    \"comment\": \"\(comment)\",\n    \"bookedFrom\": \"\(bookedFrom)\",\n    \"bookedTill\": \"\(bookedTill)\"\n}"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: ApiPath.postTable.rawValue)!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = postData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        return
      }
      print(String(data: data, encoding: .utf8)!)
    }
    task.resume()
  }
}
