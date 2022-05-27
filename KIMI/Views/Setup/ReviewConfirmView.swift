//
//  ReviewConfirmView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 27.05.2022..
//

import SwiftUI

struct ReviewConfirmView: View {

  @State private var setupFinished = false
  @State private var image: Image?
  @State private var errorWrapper: ErrorWrapper?

  @Binding var aid: AutonomousIdentifier

  var store = WalletStore()

  var body: some View {
    VStack {
      Image("create_alias")

      Text("Alias:")
        .font(Font(uiFont: .subheadline))
        .color(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
      TextField("John Smith - Work", text: $aid.alias)
        .textFieldStyle(.roundedBorder)

      Text("Witnesses:")
        .font(Font(uiFont: .subheadline))
        .color(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
      List {
        ForEach(aid.witnessURLs, id: \.self) { url in
          Text(url.absoluteString)
        }
      }
      .frame(height: 200)
      .listStyle(.plain)

      if let img = image {
        img
          .resizable()
          .scaledToFill()
          .frame(width: 200, height: 200)
          .clipped()
      } else {
        Image(systemName: "photo")
          .font(.system(size: 100))
          .accentColor(Color(colorType: .subheadline))
      }

      Button {

        store.aids.append(aid)

        Task {
          do {
            try await WalletStore.save(aids: store.aids)
          } catch {
            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
          }
        }

        setupFinished = true
      } label: {
        Text("Confirm")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))
      .padding()

      NavigationLink(
        destination: ContentView(),
        isActive: $setupFinished
      ) {}

      Spacer()

    }
    .padding(20)
    .navigationTitle("Review and Confirm")
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      if let imgData = aid.photo {
        image = Image(uiImage: UIImage(data: imgData)!)
      }
    }
    .sheet(item: $errorWrapper) { wrapper in
      ErrorView(errorWrapper: wrapper)
    }
  }
}

struct ReviewConfirmView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        let urls = [
          URL(string: "http://witness.com")!,
          URL(string: "http://witness.com")!,
          URL(string: "http://witness.com")!,
        ]
        ReviewConfirmView(
          aid: .constant(AutonomousIdentifier(alias: "John Smith - Work", witnessURLs: urls)))
      }
    }
  }
}
