//
//  Font+.swift
//  DesignSystem
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import Foundation
import SwiftUI

public extension Font {
    static func toUIFont(from font: Font) -> UIFont {
        switch font {
        case .largeTitle: UIFont.preferredFont(forTextStyle: .largeTitle)
        case .title: UIFont.preferredFont(forTextStyle: .title1)
        case .title2: UIFont.preferredFont(forTextStyle: .title2)
        case .title3: UIFont.preferredFont(forTextStyle: .title3)
        case .headline: UIFont.preferredFont(forTextStyle: .headline)
        case .subheadline: UIFont.preferredFont(forTextStyle: .subheadline)
        case .callout: UIFont.preferredFont(forTextStyle: .callout)
        case .caption: UIFont.preferredFont(forTextStyle: .caption1)
        case .caption2: UIFont.preferredFont(forTextStyle: .caption2)
        case .footnote: UIFont.preferredFont(forTextStyle: .footnote)
        default:
            UIFont.preferredFont(forTextStyle: .body)
        }
    }
}
