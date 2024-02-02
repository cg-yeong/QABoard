//
//  OffsetReader.swift
//  Presentation
//
//  Created by root0 on 2024/02/02.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offSetX(completion: @escaping (CGFloat) -> Void) -> some View {
        self.overlay {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self, perform: { value in
                        completion(value)
                    })
            }
        }
    }
}

/// Card Array Extension
extension [Card] {
    func indexOf(_ card: Card) -> Int {
        return self.firstIndex(of: card) ?? 0
    }
}
