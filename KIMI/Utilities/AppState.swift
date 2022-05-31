//
//  AppState.swift
//  KIMI
//
//  Created by Mijo Kaliger on 31.05.2022..
//

import SwiftUI

class AppState: ObservableObject {
  @Published var authenticated = false
  @Published var setupComplete = false
}
