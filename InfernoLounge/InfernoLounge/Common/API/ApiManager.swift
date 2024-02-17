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
  case getTable = "http://213.219.212.47:9000/api/booking/"
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

  private var id: Int = 0
  private var cancellable = Set<AnyCancellable>()

  let decoder: JSONDecoder

  // MARK: GET

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
    var request = URLRequest(url: url)
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: User.self, decoder: decoder)
      .catch { error in
      print(String(describing: error))
      return Just(User())
    }
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }

  func getTable(userId: Int) -> AnyPublisher<[TableReservation], Never> {
    let link = ApiPath.getTable.rawValue
    guard let url = URL(string: link + "\(userId)") else {
      return Just([TableReservation()]).eraseToAnyPublisher()
    }
    print(url)
    var request = URLRequest(url: url)
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: [TableReservation].self, decoder: decoder)
      .catch { error in
      print(String(describing: error))
      return Just([TableReservation()])
    }
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }

  // MARK: POST

  func postFeedback(userId: String, text: String, completion: @escaping (String) -> ()) {

    let parameters = "{\n    \"userId\" : \(userId),\n    \"text\" : \"\(text)\"\n}\n\n"
    let postData = parameters.data(using: .utf8)
    var request = URLRequest(url: URL(string: ApiPath.postFeedback.rawValue)!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "POST"
    request.httpBody = postData
    var answer: String = ""
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data,
        let response = response as? HTTPURLResponse
        else {
        print(String(describing: error))
        return
      }

      if (200 ... 299) ~= response.statusCode {
        answer = "Отзыв отправлен"
      } else {
        answer = "Попробуйте снова"
      }
      completion(answer)
      print(String(data: data, encoding: .utf8)!)
    }
    task.resume()
  }

  func postAuth(email: String, password: String) {

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
      print(String(describing: data))
      let token: Token? = try? JSONDecoder().decode(Token.self, from: data)
      KeychainHelper.token = token?.accessToken
      print(self.token)
      let jwt = JWT.decodeJWT(token: token?.accessToken ?? "")
      self.id = jwt?.payload?.id ?? 0
      self.getuser()
        .receive(on: DispatchQueue.main)
        .sink { user in
        SinletonUser.shared.user = user
      }
        .store(in: &self.cancellable)
    }
    task.resume()
  }

  func postTable(tableId: Int, people: Int, userId: Int, comment: String, bookedFrom: String, bookedTill: String, completion: @escaping (String) -> ()) {

    let parameters = "{\n    \"tableId\": \(tableId),\n    \"userId\": \(userId),\n  \"people\": \(people),\n  \"comment\": \"\(comment)\",\n  \"bookedFrom\": \"\(bookedFrom)\",\n  \"bookedTill\": \"\(bookedTill)\"\n}\n"
    let postData = parameters.data(using: .utf8)

    print(parameters)
    var request = URLRequest(url: URL(string: ApiPath.postTable.rawValue)!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("\(token)", forHTTPHeaderField: "Authorization")
    request.httpMethod = "POST"
    print(token)
    request.httpBody = postData
    var answer: String = ""
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data,
        let response = response as? HTTPURLResponse else {
        print(String(describing: error))
        return
      }
      if (200 ... 299) ~= response.statusCode {
        answer = "Стол забронирован"
      } else {
        answer = "Попробуйте снова"
      }
      print(String(data: data, encoding: .utf8)!)
      completion(answer)
    }
    task.resume()
  }

  func postRegistration(email: String, name: String, birthday: String, phone: String, password: String, completion: @escaping (String) -> ()) {

    let parameters = "{\n    \"name\" : \"\(name)\",\n    \"birthday\" : \"\(birthday)\",\n    \"email\" : \"\(email)\",\n    \"password\" : \"\(password)\"\n}\n\n"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: ApiPath.postRegistration.rawValue)!, timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = postData

    var answer: String = ""

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data,
        let response = response as? HTTPURLResponse else {
        print(String(describing: error))
        return
      }
      if (200 ... 299) ~= response.statusCode {
        answer = "Регистрация успешна"
      } else {
        answer = "Попробуйте снова"
      }
      print(String(data: data, encoding: .utf8)!)
      completion(answer)
    }
    task.resume()
  }
}
