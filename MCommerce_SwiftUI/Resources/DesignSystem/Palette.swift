//
//  Palette.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 16/10/22.
//

import SwiftUI

final class Palette {
    
    enum CustomColor {
        case primary
        case secundary
        case inactive
        case background
        case neutral_1
        case neutral_2
        case black
        case white
        case error
        
        var automatic: Color {
            let isLightMode = true
            return isLightMode ? light : dark
        }
        
        var light: Color {
            switch self {
            case .primary:
                return Color(.sRGB, red: 63, green: 30, blue: 214, opacity: 1)
            case .secundary:
                return Color(.sRGB, red: 26, green: 123, blue: 182, opacity: 1)
            case .inactive:
                return Color(.sRGB, red: 249, green: 211, blue: 210, opacity: 1)
            case .background:
                return Color(.sRGB, red: 247, green: 247, blue: 247, opacity: 1)
            case .neutral_1:
                return Color(.sRGB, red: 102, green: 102, blue: 102, opacity: 1)
            case .neutral_2:
                return Color(.sRGB, red: 166, green: 166, blue: 166, opacity: 1)
            case .black:
                return Color(.sRGB, red: 38, green: 38, blue: 38, opacity: 1)
            case .white:
                return Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1)
            case .error:
                return Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1)
            }
        }
        
        var dark: Color {
            switch self {
            case .primary:
                return Color(.sRGB, red: 63, green: 30, blue: 214, opacity: 1)
            case .secundary:
                return Color(.sRGB, red: 26, green: 123, blue: 182, opacity: 1)
            case .inactive:
                return Color(.sRGB, red: 249, green: 211, blue: 210, opacity: 1)
            case .background:
                return Color(.sRGB, red: 247, green: 247, blue: 247, opacity: 1)
            case .neutral_1:
                return Color(.sRGB, red: 102, green: 102, blue: 102, opacity: 1)
            case .neutral_2:
                return Color(.sRGB, red: 166, green: 166, blue: 166, opacity: 1)
            case .black:
                return Color(.sRGB, red: 38, green: 38, blue: 38, opacity: 1)
            case .white:
                return Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1)
            case .error:
                return Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1)
            }
        }
    }
}
