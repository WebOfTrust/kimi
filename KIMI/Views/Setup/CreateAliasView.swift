//
//  CreateAliasView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import SwiftUI

struct CreateAliasView: View {

  @State private var showWitnessURL = false
  @State private var alias = ""
  @State private var aid = AutonomousIdentifier(alias: "John Smith - Work")

  var body: some View {
    VStack {
      Image("create_alias")

      Text(
        """
        The alias should be an easy to remember name for your AID as a Verifier (e.g. John Smith - Verifier).
        This can be changed at a later time if you have more AIDs in the future.
        """
      )
      .font(Font(uiFont: .subheadline))
      .color(.subheadline)
      .fixedSize(horizontal: false, vertical: true)
      .multilineTextAlignment(.leading)
      .padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))

      Text("What would you like your alias to be?")
        .font(Font(uiFont: .subheadline))
        .color(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)

      TextField("John Smith - Work", text: $alias)
        .textFieldStyle(.roundedBorder)

      Button {
        aid = AutonomousIdentifier(alias: alias)
        showWitnessURL = true
      } label: {
        Text("Continue")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))
      .disabled(alias.isEmpty)
      .padding()

      NavigationLink(
        destination: WitnessURLView(aid: $aid),
        isActive: $showWitnessURL
      ) {}

      Spacer()

    }
    .padding(20)
    .navigationTitle("Steps to Create Your AID")
    .navigationBarTitleDisplayMode(.inline)

  }
}

struct CreateAliasView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        CreateAliasView()
      }
    }
  }
}
