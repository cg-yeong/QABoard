//
//  QABoardApp.swift
//  QABoard
//
//  Created by root0 on 2023/11/15.
//

import SwiftUI
import Presentation
import DesignSystem

@main
struct QABoardApp: SwiftUI.App {
    @StateObject var chosenTheme = ThemeColor()

	var body: some Scene {
		WindowGroup {
            ContentView()
                .environmentObject(chosenTheme)
		}
	}
}

struct ContentView: View {
	var body: some View {
        QnaTabView(activeTab: .library)
	}
}

struct TestLabel: View {
    var body: some View {
        Label(
            title: {
                Text("Slanje seksualno eksplicitno ili neprikladno\nporuke su strogo zabranjene i mogu rezultirati\nsuspenzija ili ukidanje računa.")
                    .font(.system(size: 13.0, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(white: 112.0 / 255.0))
            },
            icon: {
                PresentationAsset.icoCaution70.swiftUIImage
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, -18)
//                    .padding(.leading, 20)

            }
        )
    }
}

#Preview {
    TestLabel()
        .environmentObject(ThemeColor())
}
