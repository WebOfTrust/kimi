//
//  Button.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
  var foreground = Color.white
  var background = Color.blue

  func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    ActionButton(foreground: foreground, background: background, configuration: configuration)
  }

  struct ActionButton: View {
    var foreground: Color
    var background: Color
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    var body: some View {
      configuration.label
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .foregroundColor(isEnabled ? foreground : foreground.opacity(0.5))
        .background(isEnabled ? background : background.opacity(0.5))
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        .font(Font(uiFont: .buttonTitle))
        .shadow(color: Color(colorType: .buttonShadow), radius: 2, x: 0, y: 2)
        .cornerRadius(4)
    }
  }
}
