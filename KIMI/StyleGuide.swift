//
//  StyleGuide.swift
//  KIMI
//
//  Created by Mijo Kaliger on 24.03.2022..
//

import SwiftUI

enum ColorType: String, CaseIterable {
    /// Branding colors
    case branding
    case secondaryBranding

    /// Text colors
    case headline
    case subheadline

    /// Button colors
    case primaryAction
    case secondaryAction
    case buttonTitleColor
    case buttonShadow

    /// Background colors
    case background
    case systemBackground
    case secondaryBackground

    case shadow

    var name: String {
    self.rawValue
    }
}

extension UIColor {
    convenience init(colorType: ColorType) {
        self.init(named: colorType.name)!
    }
}

extension Color {
    init(colorType: ColorType) {
        self = Color(colorType.name)
    }
}

extension View {
  func color(_ color: ColorType) -> some View {
    self.foregroundColor(Color(colorType: color))
  }

  func background(_ color: ColorType) -> some View {
    self.background(Color(colorType: color))
  }
}

extension Shape {
  func fill(_ color: ColorType) -> some View {
    self.fill(Color(color.name))
  }

  func stroke(_ color: ColorType) -> some View {
    self.stroke(Color(color.name))
  }
}

extension UIFont {
    class var navTitle: UIFont {
      return UIFont(name: "AvenirNext-Bold", size: 20.0)!
    }

    class var headline: UIFont {
      return UIFont(name: "AvenirNext-Bold", size: 16.0)!
    }

    class var buttonTitle: UIFont {
      return UIFont(name: "AvenirNext-DemiBold", size: 12.0)!
    }

    class var subheadline: UIFont {
      return UIFont(name: "AvenirNext-Medium", size: 12.0)!
    }
}

extension Font {
  init(uiFont: UIFont) {
    self = Font(uiFont as CTFont)
  }
}

struct Spacing {
    static let containerPadding: CGFloat = 29.0
    static let contentPadding: CGFloat = 36.0
    static let contentSpacing: CGFloat = 31.0
}
