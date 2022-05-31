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
  @State private var errorWrapper: ErrorWrapper?
  @State private var showOnboarding = true
  @StateObject private var state = AppState()
  @Environment(\.scenePhase) var scenePhase

  var body: some Scene {
    WindowGroup {
      NavigationView {
        if showOnboarding {
          WelcomeView()
        } else {
          ContentView()
        }
      }
      .onAppear {
        Task {
          do {
            store.aids = try await WalletStore.load()
            if store.aids.count == 0 {
              showOnboarding = true
            } else {
              showOnboarding = false
            }
          } catch {
            errorWrapper = ErrorWrapper(error: error, guidance: "Reseting to onboarding.")
          }
        }
      }
      .sheet(item: $errorWrapper) { wrapper in
        ErrorView(errorWrapper: wrapper)
      }
      .environmentObject(store)
      .environmentObject(state)
      .onChange(of: scenePhase) { newPhase in
        switch newPhase {
        case .active:
          if state.authenticated == false && state.setupComplete {
            Task {
              do {
                let authenticationState = try await Authentication.authenticate()

                if authenticationState == .authenticated {
                  state.authenticated = true
                }

              } catch {
                errorWrapper = ErrorWrapper(error: error, guidance: "")
              }
            }
          }
        case .background, .inactive:
          state.authenticated = false
        @unknown default:
          errorWrapper = ErrorWrapper(
            error: AuthError.unknownError,
            guidance: "Unsupported app state. Please report a bug.")
        }
      }
      .onChange(of: state.setupComplete) { newValue in
        if newValue == true {
          showOnboarding = false
        } else {
          showOnboarding = true
        }
      }
    }
  }
}
