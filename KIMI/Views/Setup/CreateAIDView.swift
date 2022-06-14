//
//  CreateAIDView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import SwiftUI

struct CreateAIDView: View {

  @State private var showSteps = false

  var body: some View {
    VStack(spacing: 50) {
      Image("create_aid")

      Text(
        """
        In order to provide authorization, you will first have to create your own AID.

        Your identifier is a KERI-generated way for others to identify you for the purposes of
        conducting business or verification.
        """
      )
      .font(Font(uiFont: .subheadline))
      .color(.subheadline)
      .fixedSize(horizontal: false, vertical: true)

      Button {
        showSteps = true
      } label: {
        Text("Continue")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))

      NavigationLink(destination: StepsToCreateAIDView(), isActive: $showSteps) {}

      Spacer()

    }
    .padding(20)
    .navigationTitle("Create Your AID")
    .navigationBarTitleDisplayMode(.inline)

  }
}

struct CreateAIDView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        CreateAIDView()
      }
    }
  }
}
