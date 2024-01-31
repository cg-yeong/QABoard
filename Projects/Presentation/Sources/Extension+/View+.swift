//
//  View+.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

extension View {
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

extension View {
    func asSmallAnswerEditor() -> some View {
        modifier(SmallAnswerTextEditor())
    }
}

extension Int {
    var toQNumkey: String {
        var retStr = "\(self)"

        if self > 0, self < 10 {
            retStr = "0\(retStr)"
        }

        return retStr
    }

    var toANumKey: String {
        var retStr = ""
        if self > 0, self < 10 {
            retStr = AnswerNumberKey(rawValue: self)!.key
        } else {
            retStr = "\(self)"
        }

        return retStr
    }
}
