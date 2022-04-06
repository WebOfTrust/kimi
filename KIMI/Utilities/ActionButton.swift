//
//  ActionButton.swift
//  KIMI
//
//  Created by Mijo Kaliger on 24.03.2022..
//

import SwiftUI

struct ActionButton: View {
    var text: String
    var background: ColorType
    var action: (() -> Void)

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
            }
            .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
            .background(self.background)
            .color(.buttonTitleColor)
            .font(Font(uiFont: .buttonTitle))
            .shadow(color: Color(colorType: .buttonShadow), radius: 2, x: 0, y: 2)
            .cornerRadius(4)
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: .continuous
                )
                .fill(self.background)
            )
        }
    }
}
