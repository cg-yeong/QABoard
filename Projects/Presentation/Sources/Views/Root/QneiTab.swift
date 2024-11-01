//
//  QneiTab.swift
//  Presentation
//
//  Created by root0 on 2024/02/05.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

public struct QneiTabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: QneiTab
    var animation: Namespace.ID
    @Binding var activeTab: QneiTab
    @Binding var postion: CGPoint

    @State private var tabPos: CGPoint = .zero
    public var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: tab.iconName)
                .font(.title2)
                .foregroundStyle(activeTab == tab ? .white : inactiveTint)
                /// 선택된 탭은 크기 키워주기
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(LinearGradient(colors: [tint, .cyan], startPoint: .top, endPoint: .bottom))
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }

            Text(tab.rawValue)
                .font(.caption)
                .padding(.top, activeTab == tab ? 0 : 0)
                .foregroundStyle(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition { rect in
            tabPos.x = rect.midX

            if activeTab == tab {
                postion.x = rect.midX
            }
        }
        .onTapGesture {
            activeTab = tab

            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                postion.x = tabPos.x
            }
        }
    }

}

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

            let to1 = CGPoint(x: midPoint, y: -25)
            let control1 = CGPoint(x: midPoint - 25, y: 0)
            let control2 = CGPoint(x: midPoint - 25, y: -25)

            path.addCurve(to: to1, control1: control1, control2: control2)

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
