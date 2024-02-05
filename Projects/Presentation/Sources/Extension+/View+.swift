//
//  View+.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

// MARK: View~Path+
extension View {
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> Void) -> some View {
        self.overlay {
            GeometryReader {
                let rect = $0.frame(in: .global)

                Color.clear
                    .preference(key: PositionKey.self, value: rect)
                    .onPreferenceChange(PositionKey.self, perform: completion)
            }
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
        if self > 0, self < 11 {
            retStr = AnswerNumberKey(rawValue: self)!.key
        } else {
            retStr = "\(self)"
        }

        return retStr
    }
}
