//
//  ErrorView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 25.05.2022..
//

import SwiftUI

struct ErrorView: View {
  let errorWrapper: ErrorWrapper

  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    NavigationView {
      VStack {
        Text("An error has occurred!")
          .font(.title)
          .padding(.bottom)
        Text(errorWrapper.error.localizedDescription)
          .font(.headline)
        Text(errorWrapper.guidance)
          .font(.caption)
          .padding(.top)
        Spacer()
      }
      .padding()
      .cornerRadius(16)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
  }
}

struct ErrorView_Previews: PreviewProvider {
  enum SampleError: Error {
    case errorRequired
  }

  static var wrapper: ErrorWrapper {
    ErrorWrapper(
      error: SampleError.errorRequired,
      guidance: "You can safely ignore this error.")
  }

  static var previews: some View {
    ErrorView(errorWrapper: wrapper)
  }
}
