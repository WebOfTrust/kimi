//
//  AutonomousIdentifier.swift
//  KIMI
//
//  Created by Mijo Kaliger on 24.05.2022..
//

import Foundation

struct AutonomousIdentifier: Identifiable, Codable {
  let id: UUID
  var alias: String
  var witnessURLs: [URL] = []
  var photo: Data?
  var advanced = Advanced()

  init(id: UUID = UUID(), alias: String, witnessURLs: [URL] = [], photo: Data? = nil) {
    self.id = id
    self.alias = alias
    self.witnessURLs = witnessURLs
    self.photo = photo
  }

  struct Advanced: Codable {
    var inceptingSigningThreshold = 1
    var inceptingKeyCount = 1
    var nextSigningThreshold = 1
    var nextKeyCount = 1
    var witnessThreshold = 1
  }
}
