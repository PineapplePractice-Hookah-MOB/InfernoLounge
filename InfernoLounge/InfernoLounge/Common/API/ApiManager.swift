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
  case postAuth = "http://213.219.212.47:9000/api/auth/authenticate"
  case getUsers = "http://213.219.212.47:9000/api/users/all?from=0&size=100"
  case getUser = "http://213.219.212.47:9000/api/users"
  case postFeedback = "http://213.219.212.47:9000/api/comment"
}

final class ApiManager {

  init() {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    self.decoder = decoder
  }

  private var token: String {
     "Bearer \(KeychainHelper.token ?? "")"
  }

  private var id: Int = 3

  let decoder: JSONDecoder

  func post(tableId: Int, people: Int, comment: String, bookedFrom: String, bookedTill: String) {

    let parameters = "{\n    \"tableId\": \(tableId),\n    \"people\": \(people),\n    \"comment\": \"\(comment)\",\n    \"bookedFrom\": \"\(bookedFrom)\",\n    \"bookedTill\": \"\(bookedTill)\"\n}"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: ApiPath.postTable.rawValue)!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")
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

    let parameters = "{\n    \"name\" : \"\(name)\",\n    \"birthday\" : \"\(birthday)\",\n    \"email\" : \"\(email)\",\n    \"password\" : \"\(password)\"\n}\n\n"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: ApiPath.postRegistration.rawValue)!, timeoutInterval: Double.infinity)
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

  func postAuth(email: String, password: String){

    let parameters = "{\n    \"email\" : \"\(email)\",\n    \"password\" : \"\(password)\"\n}\n\n"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: ApiPath.postAuth.rawValue)!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = postData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        return
      }

      let token: Token? = try? JSONDecoder().decode(Token.self, from: data)
      KeychainHelper.token = token?.accessToken
      print(self.token)
      let jwt = JWT.decodeJWT(token: token?.accessToken ?? "")
      self.id = jwt?.payload?.id ?? 0
    }
    task.resume()
  }

  func getUsers() -> AnyPublisher<[User], Never> {
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

  func getuser() -> AnyPublisher<User, Never> {
    let link = ApiPath.getUser.rawValue
    guard let url = URL(string: link + "/\(id)") else {
      return Just(User()).eraseToAnyPublisher()
    }
    print(url)
    var request = URLRequest(url: url)
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .map {
        print(try? JSONSerialization.jsonObject(with: $0))
        return $0
      }
      .decode(type: User.self, decoder: decoder)
      .catch { error in
      print(String(describing:error))
      return Just(User())
      }
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }

  func postFeedback(userId: String, text: String) {

    let parameters = "{\n    \"userId\" : \(id),\n    \"text\" : \"\(text)\"\n}\n\n"
    let postData = parameters.data(using: .utf8)
    var request = URLRequest(url: URL(string: ApiPath.postFeedback.rawValue)!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")

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
