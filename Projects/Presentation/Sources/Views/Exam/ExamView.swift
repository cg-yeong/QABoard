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
    private var intent: ExamIntent { container.intent }
    private var state: ExamModelStateProtocol { container.model }

    var body: some View {
        page
            .onAppear {
                intent.viewOnAppear()
            }
    }
    
    @ViewBuilder
    private var page: some View {
        switch state.contentState {
        case .prev:
            VStack {
                HStack {
                    Image(systemName: "doc")
                        .font(.title)

                    Text("Pre Test")
                        .font(.title)

                    Image(systemName: "doc.text")
                        .font(.title)
                }

                Button {
                    intent.changeContent(.during)
                } label: {
                    Text("Move to Test")
                        .bold()
                        .padding()
                        .foregroundStyle(.white)
                }
                .background(.cyan)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }

        case .during:
            ScrollView {
                ExamQuiz(quiz: Quiz.default)

                Button {
                    // go to scoring page
                    // and show loading progress once animation?
                    intent.changeContent(.score)
                } label: {
                    Text("Submit")
                        .padding()
                }

            }
        case .score:
            ScrollView {
                HStack {
                    Image(systemName: "pencil.and.outline")
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(.red)
                        .font(.title)
                    Text("Score Exam Results")
                        .font(.title3)
                    Image(systemName: "line.diagonal")
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(.red)
                        .font(.title)
                        .rotationEffect(.degrees(-15))
                }

                ExamQuiz(quiz: Quiz.scoreDefault)
            }

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
