//
//  ContentView.swift
//  kimi
//
//  Created by Kevin Griffin on 3/17/22.
//

import Combine
import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      ZStack(alignment: .top) {
        Color(ColorType.background.name)
          .ignoresSafeArea(.all, edges: .bottom)

        ContainerView {
          VStack(spacing: Spacing.contentSpacing) {
            Text("Welcome to KEEP")
              .font(Font(uiFont: .headline))

            Image("welcome")

            Text(
              "To get started and enter the software, you will utilize either your PIN or Face ID."
            )
            .font(Font(uiFont: .subheadline))
            .color(.subheadline)
            .fixedSize(horizontal: false, vertical: true)

            HStack {
              Spacer()

              // ActionButtonView(text: "Continue", background: .primaryAction) {}
            }

          }.padding(Spacing.contentPadding)
        }
        .fixedSize(horizontal: false, vertical: true)

      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("KIMI")
            .color(.branding)
            .font(Font(uiFont: .navTitle))
        }
      }
    }
  }
}

struct ContentView2: View {

  @ObservedObject var user = User()
  @State var showCreateAID = false

  var body: some View {
    NavigationView {

      //      switch user.authState {
      //      case .loggedout:
      //          Setup.Welcome(user: user)
      //      case .loggedin(let setupCompleted):
      //          if setupCompleted {
      //            // Show dashboard
      //          } else {
      //            NavigationLink("Create AID", destination: Setup.CreateAID(user: user), isActive: $showCreateAID)
      //              .hidden()
      //          }
      //      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView2()
    }
  }
}
