//
//  SelectAliasPhotoView.swift
//  KIMI
//
//  Created by Mijo Kaliger on 27.05.2022..
//

import SwiftUI
import UIKit

struct SelectAliasPhotoView: View {

  @State private var setupFinished = false
  @State private var showingImagePicker = false
  @State private var inputImage: UIImage?
  @State private var image: Image?

  @Binding var aid: AutonomousIdentifier

  var body: some View {
    VStack(spacing: 50) {
      Image("create_aid")

      Text(
        "If you would like your alias to have a photo instead of the default icon, please select a photo."
      )
      .font(Font(uiFont: .subheadline))
      .color(.subheadline)
      .fixedSize(horizontal: false, vertical: true)

      Button {
        showingImagePicker = true
      } label: {
        if let img = image {
          img
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
        } else {
          Image(systemName: "photo")
            .font(.system(size: 100))
        }
      }

      Button {
        setupFinished = true
      } label: {
        Text("Continue")
      }
      .buttonStyle(ActionButtonStyle(background: Color(colorType: .primaryAction)))

      NavigationLink(destination: ReviewConfirmView(aid: $aid), isActive: $setupFinished) {}

      Spacer()

    }
    .padding(20)
    .navigationTitle("Select a Photo for the Alias")
    .navigationBarTitleDisplayMode(.inline)
    .onChange(of: inputImage) { _ in loadImage() }
    .sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: $inputImage)
    }

  }

  func loadImage() {
    guard let inputImage = inputImage else { return }
    image = Image(uiImage: inputImage)
    aid.photo = inputImage.jpegData(compressionQuality: 1.0)
  }
}

struct SelectAliasPhotoView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        SelectAliasPhotoView(aid: .constant(AutonomousIdentifier(alias: "John Smith - Work")))
      }
    }
  }
}
