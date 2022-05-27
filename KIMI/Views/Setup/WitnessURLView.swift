//
//  WitnessURLView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 26.05.2022..
//

import SwiftUI

struct WitnessURLView: View {

  @State private var showConfigureAdvanced = false
  @State private var url = ""
  @State private var urls = [String]()

  @Binding var aid: AutonomousIdentifier

  var body: some View {
    VStack(spacing: 50) {
      Image("create_alias")

      Text("Enter your witness URLs below or continue on with the default witnesses.")
        .font(Font(uiFont: .subheadline))
        .color(.subheadline)
        .fixedSize(horizontal: false, vertical: true)

      HStack(spacing: 15) {
        TextField("Enter Witness URL", text: $url)
          .textFieldStyle(.roundedBorder)
        Button {
          urls.append(url)
          url = ""
        } label: {
          Image(systemName: "plus.circle")
        }
        .disabled(url.isEmpty)
      }

      List {
        ForEach(urls, id: \.self) { url in
          Text(url)
        }
        .onDelete { indices in
          urls.remove(atOffsets: indices)
        }
      }
      .listStyle(.plain)

      Button {
        aid.witnessURLs = urls.compactMap { URL(string: $0) }
        showConfigureAdvanced = true
      } label: {
        Text("Continue")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))

      NavigationLink(
        destination: ConfigureAdvancedView(aid: $aid),
        isActive: $showConfigureAdvanced
      ) {}

      Spacer()

    }
    .ignoresSafeArea(.keyboard)
    .padding(20)
    .navigationTitle("Enter Witness URLs")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct WitnessURLView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        WitnessURLView(aid: .constant(AutonomousIdentifier(alias: "John Smith - Work")))
      }
    }
  }
}
