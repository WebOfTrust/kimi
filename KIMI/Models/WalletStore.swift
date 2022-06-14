//
//  WalletStore.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import Foundation

class WalletStore: ObservableObject {
  @Published var aids: [AutonomousIdentifier] = []

  private static func fileURL() throws -> URL {
    try FileManager.default.url(
      for: .documentDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: false
    )
    .appendingPathComponent("wallet.data")
  }

  static func load() async throws -> [AutonomousIdentifier] {
    try await withCheckedThrowingContinuation { continuation in
      load { result in
        switch result {
        case .failure(let error):
          continuation.resume(throwing: error)
        case .success(let aids):
          continuation.resume(returning: aids)
        }
      }
    }
  }

  static func load(completion: @escaping (Result<[AutonomousIdentifier], Error>) -> Void) {
    DispatchQueue.global(qos: .background).async {
      do {
        let fileURL = try fileURL()
        guard let file = try? FileHandle(forReadingFrom: fileURL) else {
          DispatchQueue.main.async {
            completion(.success([]))
          }
          return
        }
        let aids = try JSONDecoder().decode(
          [AutonomousIdentifier].self, from: file.availableData)
        DispatchQueue.main.async {
          completion(.success(aids))
        }
      } catch {
        DispatchQueue.main.async {
          completion(.failure(error))
        }
      }
    }
  }

  @discardableResult
  static func save(aids: [AutonomousIdentifier]) async throws -> Int {
    try await withCheckedThrowingContinuation { continuation in
      save(aids: aids) { result in
        switch result {
        case .failure(let error):
          continuation.resume(throwing: error)
        case .success(let aidsSaved):
          continuation.resume(returning: aidsSaved)
        }
      }
    }
  }

  static func save(
    aids: [AutonomousIdentifier], completion: @escaping (Result<Int, Error>) -> Void
  ) {
    DispatchQueue.global(qos: .background).async {
      do {
        let data = try JSONEncoder().encode(aids)
        let outfile = try fileURL()
        try data.write(to: outfile)
        DispatchQueue.main.async {
          completion(.success(aids.count))
        }
      } catch {
        DispatchQueue.main.async {
          completion(.failure(error))
        }
      }
    }
  }
}
