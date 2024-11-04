//
//  ExamQnA.swift
//  Presentation
//
//  Created by root0 on 5/31/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI
import DesignSystem

enum QnAResult: Int {
    case wrong = -1
    case testing = 0
    case correct = 1

    init(_ rawValue: Int) {
        switch rawValue {
        case 1:
            self = .correct
        case -1:
            self = .wrong
        default:
            self = .testing
        }
    }
}

struct ExamQnA: View {
    var qNum = 1
    var question = ""
    var aCount = 1

    var status: QnAResult = .testing

    init(qNum: Int = 1,
         question: String = "",
         aCount: Int = 1,
         status: Int = 0) {
        self.qNum = qNum
        self.question = question
        self.aCount = aCount
        self.status = QnAResult(status)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(qNum.toQNumkey)
                    .font(.title2.bold())
                    .foregroundStyle(Theme.yeong.questionNumber)
                    .overlay {
                        // X: line.diagonal, O: pencil.and.outline
                        if case .correct = status {
                            Image(systemName: "pencil.and.outline")
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(.red)
                                .font(.title)
                        } else if case .wrong = status {
                            Image(systemName: "line.diagonal")
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(.red)
                                .font(.title)
                        }
                    }

                Text(question)
                    .font(.title3.bold())
                    .foregroundStyle(.black)
            }

            setAnswers(count: aCount)
        }
        .padding()
        .background(.white)
    }

    func setAnswers(count answers: Int) -> some View {
        ForEach(0..<answers, id: \.self) { aNum in
            SmallAnswer(answerNo: aNum + 1, subTitle: "")
                .disabled(status != .testing)
        }
    }
}

#Preview {
    ExamQnA(
        qNum: 1,
        question: "안녕하세요 오늘 날짜는? ㅋㅋ",
        aCount: 10,
        status: 1
    )
}
