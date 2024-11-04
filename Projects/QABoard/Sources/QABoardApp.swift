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

#Preview {
    ContentView()
}
