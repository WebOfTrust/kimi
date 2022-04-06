//
//  ContainerView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 24.03.2022..
//

import SwiftUI

struct ContainerView<Content>: View where Content: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(4)

            content()
        }
        .padding(Spacing.containerPadding)
        //.frame(idealWidth: .infinity, idealHeight: 300)
        .shadow(color: Color(colorType: .shadow), radius: 4, x: 0, y: 3)
    }
}
