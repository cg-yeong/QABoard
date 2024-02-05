//
//  TextEditor+.swift
//  Presentation
//
//  Created by root0 on 2024/02/05.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

// MARK: TextEditor+
public extension TextEditor {
    func transparentScrolling() -> some View {
        if #available(iOS 16.0, *) {
            return scrollContentBackground(.hidden)
        } else {
            return onAppear(perform: {
                UITextView.appearance().backgroundColor = .clear
            })
        }
    }
}
