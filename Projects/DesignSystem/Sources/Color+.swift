//
//  Color+.swift
//  DesignSystem
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import Foundation
import SwiftUI

public extension Color {

    init(hex: String, opacity: Double = 1.0) {
        let cleanHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")

        let hex = Int(cleanHex, radix: 16)!

        self.init(hex: hex, opacity: opacity)
    }

    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }

    /// 간단하게 rgb 설정하기
    /// - redF: 0 ~ 255
    /// - greenF: 0 ~ 255
    /// - blueF: 0 ~ 255
    /// - alpha: 0 ~ 1
    init(redF: Double, greenF: Double, blueF: Double, opacity: Double = 1.0) {
        self.init(
            red: redF / 255.0,
            green: greenF / 255.0,
            blue: blueF / 255.0,
            opacity: opacity
        )
    }
}
