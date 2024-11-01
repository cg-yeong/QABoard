//
//  QnaTabView.swift
//  Presentation
//
//  Created by root0 on 2023/11/27.
//

import SwiftUI

public struct QnaTabView: View {

    @State var activeTab = QneiTab.library
    /// 부드러운 슬라이딩 이펙트 -> matched Geometry effect
    @Namespace private var animation
    @State private var tabShapePos: CGPoint = .zero

    public init(activeTab: QneiTab) {
        self.activeTab = activeTab
        UITabBar.appearance().isHidden = true
    }

    public var body: some View {
        featureTabs
    }

    @ViewBuilder
    public var featureTabs: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab,
                    content: {
                ParallaxCarousel().tag(QneiTab.library)
                Text("Memorize").tag(QneiTab.memorize)
                WriteFeature().tag(QneiTab.write)
                ExamQuiz(quiz: .default).tag(QneiTab.exam)
            })
            .padding(.bottom, -50)

            makeQneiTabBar()
        }
    }

    @ViewBuilder
    public func presentWriteSheet() -> some View {
//        Color(hex: "#7326d3")
        Menu("Write Quiz") {
            Button("+ Quiz", action: {})
            Button("+ Answer", action: {})
        }
    }
}

public extension QnaTabView {

    /// Custom Tab Bar
    /// With More Easy Customization
    @ViewBuilder
    func makeQneiTabBar(_ tint: Color = .indigo, _ inactiveTint: Color = .gray) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(QneiTab.allCases, id: \.rawValue) { tab in
                QneiTabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: tab,
                    animation: animation,
                    activeTab: $activeTab,
                    postion: $tabShapePos
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            QneiTabShape(midPoint: tabShapePos.x)
                .fill(.white )
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        }
        /// 애니메이션 추가
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }

}

struct WriteView: View {
    var body: some View {
        Text("write")
    }
}
struct LibraryView: View {
    var body: some View {
        Text("library")
    }
}

#Preview {
    QnaTabView(activeTab: .write)
        .environmentObject(ThemeColor())
}
