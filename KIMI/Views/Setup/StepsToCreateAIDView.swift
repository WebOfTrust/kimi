//
//  StepsToCreateAIDView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import SwiftUI

struct StepsToCreateAIDView: View {

  @State private var showCreateAlias = false

  var body: some View {
    VStack(spacing: 50) {
      Image("steps_to_create")

      Text(
        """
        1. Create an Alias

        2. Configure your AID

        3. Select a photo for your alias
        """
      )
      .font(Font(uiFont: .subheadline))
      .color(.subheadline)
      .fixedSize(horizontal: false, vertical: true)

      Button {
        showCreateAlias = true
      } label: {
        Text("Continue")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))

      NavigationLink(destination: CreateAliasView(), isActive: $showCreateAlias) {}

      Spacer()

    }
    .padding(20)
    .navigationTitle("Steps to Create Your AID")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct StepsToCreateAIDView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        StepsToCreateAIDView()
      }
    }
  }
}
