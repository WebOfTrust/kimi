//
//  ContentView.swift
//  kimi
//
//  Created by Kevin Griffin on 3/17/22.
//

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

                        Text("To get started and enter the software, you will utilize either your PIN or Face ID.")
                            .font(Font(uiFont: .subheadline))
                            .color(.subheadline)
                            .fixedSize(horizontal: false, vertical: true)

                        HStack {
                            Spacer()

                            ActionButton(text: "Continue", background: .primaryAction) {

                            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
