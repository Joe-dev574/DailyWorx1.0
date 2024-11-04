//
//  Color.swift
//  DailyWorx1.0
//
//  Created by Joseph DeWeese on 11/4/24.
//

import UIKit
import SwiftUI


extension Color {

    private enum CodingKeys: String, CodingKey {
        case red
        case green
        case blue
        case alpha
    }

    /// A new random color.
    static var random: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
    

    // MARK: - font colors
    /// This color is either black or white, whichever is more accessible when viewed against the scrum color.
    var accessibleFontColor: Color {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil)
        return isLightColor(red: red, green: green, blue: blue) ? .black : .white
    }
    
    private func isLightColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> Bool {
        let lightRed = red > 0.65
        let lightGreen = green > 0.65
        let lightBlue = blue > 0.65

        let lightness = [lightRed, lightGreen, lightBlue].reduce(0) { $1 ? $0 + 1 : $0 }
        return lightness >= 2
    }
}

