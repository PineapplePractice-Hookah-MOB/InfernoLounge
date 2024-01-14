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
  case postRegistration = "http://213.219.212.47:9000/api/auth/register"
  case getUsers = "http://213.219.212.47:9000/api/users/all?from=0&size=5"
  case getUser = "http://213.219.212.47:9000/api/users/"
}

final class ApiManager {

  init() {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    self.decoder = decoder
  }

  let decoder: JSONDecoder

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

  func postRegistration(email: String, name: String, birthday: String, phone: String, password: String) {

    let parameters = "{\n    \"name\" : \"\(name)\",\n    \"phone\" : \"\(phone)\",\n    \"birthday\" : \"\(birthday)\",\n    \"email\" : \"\(email)\",\n    \"password\" : \"\(password)\"\n}\n"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: ApiPath.postRegistration.rawValue)!,timeoutInterval: Double.infinity)
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

  func getUsers() -> AnyPublisher<[User], Never>
  {
    let link = ApiPath.getUsers.rawValue
      guard let url = URL(string: link) else {
        return Just([User()]).eraseToAnyPublisher()
      }

      return URLSession.shared.dataTaskPublisher(for: url)
          .map(\.data)
          .decode(type: [User].self, decoder: decoder)
          .catch { error in
            Just([User()]) }
          .receive(on: RunLoop.main)
          .eraseToAnyPublisher()
  }
  
  func getuser(userId: Int) -> AnyPublisher<User, Never> {
    let link = ApiPath.getUser.rawValue
      guard let url = URL(string: link + "\(userId)") else {
          return Just(User()).eraseToAnyPublisher()
      }

      return URLSession.shared.dataTaskPublisher(for: url)
          .map(\.data)
          .decode(type: User.self, decoder: decoder)
          .catch { error in Just(User()) }
          .receive(on: RunLoop.main)
          .eraseToAnyPublisher()
  }
}
