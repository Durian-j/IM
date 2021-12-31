//
//  HexColor.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

struct IMColor {
    // 主题色
    static var themeColor : Color = Color(hex: 0x2E59E6)
    // 正文颜色
    static var textColor : Color = Color(hex: 0x333333)
    // 浅灰色
    static var lightGray : Color = Color(hex: 0xF4F5F9)
    // 深灰色
    static var darkGray : Color = Color(hex: 0x6B7380)
    // 红色
    static var red : Color = Color(hex: 0xfC4525)
}
