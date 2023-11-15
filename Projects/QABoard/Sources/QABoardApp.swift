//
//  QABoardApp.swift
//  QABoard
//
//  Created by root0 on 2023/11/15.
//

import SwiftUI

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
//        Text("ContentView")
        Button("Create Scene") {
            if #available(iOS 17.0, *) {
                UIApplication.shared.activateSceneSession(for: .init(role: .windowApplication), errorHandler: nil)
            } else {
                // Fallback on earlier versions
                
                UIApplication.shared.requestSceneSessionActivation(nil, userActivity: nil, options: nil, errorHandler: nil)
            }
        }
    }
}

#Preview {
    ContentView()
}
