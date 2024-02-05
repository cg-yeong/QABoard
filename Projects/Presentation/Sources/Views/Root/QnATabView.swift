//
//  QnaTabView.swift
//  Presentation
//
//  Created by root0 on 2023/11/27.
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
                Text("Library").tag(QneiTab.library)
                Text("Memorize").tag(QneiTab.memorize)
                Text("Write").tag(QneiTab.write)
                Text("Exam").tag(QneiTab.exam)
            })

            makeQneiTabBar()
        }
    }

}

public extension QnaTabView {

    /// Custom Tab Bar
    /// With More Easy Customization
    @ViewBuilder
    func makeQneiTabBar(_ tint: Color = .indigo, _ inactiveTint: Color = .blue) -> some View {
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
    QnaTabView(activeTab: .library)
        .environmentObject(ThemeColor())
}
