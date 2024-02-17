//
//  KeychainHelper.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 16.01.24.
//

import Foundation
import SwiftKeychainWrapper

final class KeychainHelper {

  private static var keychainToken = "QAirSenseToken"

  static var token: String? {
    get {
      KeychainWrapper.standard.string(forKey: Self.keychainToken)
    } set {
      if let newValue {
        KeychainWrapper.standard.set(newValue, forKey: Self.keychainToken)
      } else {
        KeychainWrapper.standard.removeObject(forKey: Self.keychainToken)
      }
    }
  }

}
