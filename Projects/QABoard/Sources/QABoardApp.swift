//
//  QABoardApp.swift
//  QABoard
//
//  Created by root0 on 2023/11/15.
//

import SwiftUI
import Presentation

@main
struct QABoardApp: SwiftUI.App {

	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

struct ContentView: View {
	var body: some View {
		QnaTabView()
	}
}

#Preview {
	ContentView()
}
