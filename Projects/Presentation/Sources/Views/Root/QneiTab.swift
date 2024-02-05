//
//  QneiTab.swift
//  Presentation
//
//  Created by root0 on 2024/02/05.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct QneiTabShape: Shape {
    var midPoint: CGFloat

    var animatableData: CGFloat {
        get { midPoint }
        set { midPoint = newValue }
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            /// First Drawing the Rectangle Shape
            path.addPath(Rectangle().path(in: rect))
            /// Now Drawing Upward Curve Shape
            path.move(to: .init(x: midPoint - 60, y: 0))

            let to = CGPoint(x: midPoint, y: -25)
            let control1 = CGPoint(x: midPoint - 25, y: 0)
            let control2 = CGPoint(x: midPoint - 25, y: -25)

            path.addCurve(to: to, control1: control1, control2: control2)

            let to2 = CGPoint(x: midPoint + 60, y: 0)
            let control3 = CGPoint(x: midPoint + 25, y: -25)
            let control4 = CGPoint(x: midPoint + 25, y: 0)

            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

/// Custom View+
/// Which will return View Positoin
struct PositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

public enum QneiTab: String, CaseIterable {
    case library = "Library"
    case memorize = "Memorize"
    case write = "Write"
    case exam = "Exam"

    var iconName: String {
        switch self {
        case .library: return "books.vertical"
        case .memorize: return "brain.head.profile"
        case .write: return "doc.badge.plus"
        case .exam: return "doc.append"
        }
    }

    var index: Int {
        return QneiTab.allCases.firstIndex(of: self) ?? 0
    }
}

#Preview {
    QnaTabView(activeTab: .library)
}
