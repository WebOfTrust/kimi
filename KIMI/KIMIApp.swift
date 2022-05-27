//
//  KIMIApp.swift
//  kimi
//
//  Created by Kevin Griffin on 3/17/22.
//

import SwiftUI

@main
struct KIMIApp: App {
  @StateObject private var store = WalletStore()

  var body: some Scene {
    WindowGroup {
      NavigationView {
        WelcomeView()
      }
    }
  }
}
