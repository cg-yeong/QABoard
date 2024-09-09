//
//  ExamView.swift
//  Presentation
//
//  Created by raoot0 on 11/29/23.
//

import SwiftUI
import Domain

struct ExamView: View {

    @StateObject var container: MVIContainer<ExamIntent, ExamModelStateProtocol>

    var body: some View {
//        ExamQuiz(quiz: <#T##Quiz#>)
        Text("asfd")
            .padding()
            .onAppear {
                self.container.intent.viewOnAppear()
            }
    }
}

extension ExamView {
    static func build() -> some View {
        let model = ExamModel()
        let intent = ExamIntent(model: model)
        let container = MVIContainer(
            intent: intent,
            model: model as ExamModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )

        return ExamView(container: container)
    }
}

#Preview {
    ExamView.build()
}
