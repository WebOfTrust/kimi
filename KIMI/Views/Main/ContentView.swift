//
//  ContentView.swift
//  kimi
//
//  Created by Kevin Griffin on 3/17/22.
//

import SwiftUI

struct ContentView: View {

  @State private var errorWrapper: ErrorWrapper?

  @EnvironmentObject private var state: AppState
  @EnvironmentObject var store: WalletStore

  var body: some View {
    TabView {
      homeView
        .tabItem {
          Label("Home", systemImage: "house")
        }

      contacts
        .tabItem {
          Label("Contacts", systemImage: "person.3")
        }

      tasks
        .tabItem {
          Label("Tasks", systemImage: "note.text")
        }

      credentials
        .tabItem {
          Label("Credentials", systemImage: "lock")
        }

      profile
        .tabItem {
          Label("Profile", systemImage: "person")
        }
    }
    .sheet(item: $errorWrapper) { wrapper in
      ErrorView(errorWrapper: wrapper)
    }
  }

  var homeView: some View {
    Text("Home")
  }

  var contacts: some View {
    Text("Contacts")
  }

  var tasks: some View {
    Text("Tasks")
  }

  var credentials: some View {
    Text("Credentials")
  }

  var profile: some View {
    VStack {
      Button {
        Task {
          do {
            try await WalletStore.save(aids: [])
          } catch {
            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
          }

          state.setupComplete = false
        }
      } label: {
        Text("Logout")
      }
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
    }
    .environmentObject(
      { () -> AppState in
        let envObj = AppState()
        envObj.authenticated = true
        return envObj
      }())
  }
}
