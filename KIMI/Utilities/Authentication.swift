//
//  Authentication.swift
//  KIMI
//
//  Created by Mijo Kaliger on 25.05.2022..
//

import LocalAuthentication

struct Authentication {

  enum State {
    case authenticated
    case unauthenticated
    case undefined
  }

  static func authenticate() async throws -> State {
    let authContext = LAContext()
    var error: NSError?
    if authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
      let reason = "Log in to your account"

      return try await withCheckedThrowingContinuation({ continuation in
        authContext.evaluatePolicy(
          .deviceOwnerAuthentication,
          localizedReason: reason
        ) { success, error in

          guard error == nil else {
            continuation.resume(throwing: error!)
            return
          }

          if success {
            continuation.resume(returning: .authenticated)
          } else {
            continuation.resume(returning: .unauthenticated)
          }
        }
      })
    } else if let error = error {
      throw error
    }

    return .undefined
  }
}

enum AuthError: Error {
  case unknownError
}
