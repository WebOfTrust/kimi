//
//  WelcomeView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import SwiftUI

struct WelcomeView: View {
  @State private var showCreateAID = false
  @State private var errorWrapper: ErrorWrapper?
  @State private var authenticated = false

  var body: some View {
    VStack(spacing: 50) {
      Image("welcome")

      Text("To get started, please enable either your biometrics or pin authentication.")
        .font(Font(uiFont: .subheadline))
        .color(.subheadline)
        .fixedSize(horizontal: false, vertical: true)

      Button {
        Task {
          do {
            let authenticationState = try await Authentication.authenticate()

            if authenticationState == .authenticated {
              authenticated = true
            }

          } catch {
            errorWrapper = ErrorWrapper(error: error, guidance: "")
          }
        }
      } label: {
        Text("Continue")
      }.buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))

      NavigationLink(destination: CreateAIDView(), isActive: $authenticated) {}

      Spacer()
    }
    .padding(20)
    .navigationTitle("Welcome to KEEP")
    .navigationBarTitleDisplayMode(.inline)
    .sheet(item: $errorWrapper) { wrapper in
      ErrorView(errorWrapper: wrapper)
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        WelcomeView()
      }
    }
  }
}
