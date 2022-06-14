//
//  ConfigureAdvancedView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 27.05.2022..
//

import SwiftUI

struct ConfigureAdvancedView: View {

  @State private var showSelectPhoto = false

  @Binding var aid: AutonomousIdentifier

  var body: some View {
    VStack(spacing: 50) {
      Image("create_alias")

      Text("Below is a default configuration. If you need to change, please customize below.")
        .font(Font(uiFont: .subheadline))
        .color(.subheadline)
        .fixedSize(horizontal: false, vertical: true)

      List {
        Stepper(value: $aid.advanced.inceptingSigningThreshold) {
          VStack {
            Text("Incepting Signing Threshold")
              .font(Font(uiFont: .subheadline))
              .color(.subheadline)
            Text("\(aid.advanced.inceptingSigningThreshold)")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
        Stepper(value: $aid.advanced.inceptingKeyCount) {
          VStack {
            Text("Incepting Key Count")
              .font(Font(uiFont: .subheadline))
              .color(.subheadline)
            Text("\(aid.advanced.inceptingKeyCount)")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
        Stepper(value: $aid.advanced.nextSigningThreshold) {
          VStack {
            Text("Next Signing Threshold")
              .font(Font(uiFont: .subheadline))
              .color(.subheadline)
            Text("\(aid.advanced.nextSigningThreshold)")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
        Stepper(value: $aid.advanced.nextKeyCount) {
          VStack {
            Text("Next Key Count")
              .font(Font(uiFont: .subheadline))
              .color(.subheadline)
            Text("\(aid.advanced.nextKeyCount)")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
        Stepper(value: $aid.advanced.witnessThreshold) {
          VStack {
            Text("Witness Threshold")
              .font(Font(uiFont: .subheadline))
              .color(.subheadline)
            Text("\(aid.advanced.witnessThreshold)")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
      }
      .listStyle(.plain)

      Button {
        showSelectPhoto = true
      } label: {
        Text("Continue")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))

      NavigationLink(destination: SelectAliasPhotoView(aid: $aid), isActive: $showSelectPhoto) {}

      Spacer()

    }
    .padding(20)
    .navigationTitle("Configure Advanced Options")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ConfigureAdvancedView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        ConfigureAdvancedView(aid: .constant(AutonomousIdentifier(alias: "John Smith - Work")))
      }
    }
  }
}
