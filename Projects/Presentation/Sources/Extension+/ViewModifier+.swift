//
//  ViewModifier+.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import Foundation
import SwiftUI

struct SmallAnswerTextEditor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineSpacing(5)
            .fixedSize(horizontal: false, vertical: true)
            .autocorrectionDisabled()
    }
}
