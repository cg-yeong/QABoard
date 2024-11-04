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
        if #available(iOS 16.0, *) {
            content
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
                .autocorrectionDisabled()
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
        } else {
            content
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
                .autocorrectionDisabled()
                .onAppear {
                    UITextView.appearance().backgroundColor = .clear
                    UITextView.appearance().showsVerticalScrollIndicator = false
                }
        }

    }
}

struct WiggleModifier: ViewModifier {
    let amount: Double

    @State private var isWiggling = false

    private static func randomize(interval: TimeInterval, withVariance variance: Double) -> TimeInterval {
        let random = Double.random(in: 500.0...1000.0) / 500
        return interval + variance * random
    }

    private let rotateAnimation = Animation
        .easeInOut(duration: Self.randomize(interval: 0.14, withVariance: 0.025))
        .repeatForever(autoreverses: true)

    private let bounceAnimation = Animation
        .easeInOut(duration: Self.randomize(interval: 0.18, withVariance: 0.025))
        .repeatForever(autoreverses: true)

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(isWiggling ? amount : 0))
            .animation(rotateAnimation, value: isWiggling)
            .animation(bounceAnimation, value: isWiggling)
            .onAppear {
                isWiggling.toggle()
            }
    }
}
