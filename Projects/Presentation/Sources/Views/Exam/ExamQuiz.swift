//
//  ExamQuiz.swift
//  Presentation
//
//  Created by root0 on 5/31/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

import Domain

struct ExamQuiz: View {
    internal init(quiz: Quiz) {
        self.quiz = quiz
    }

    var quiz: Quiz

    var body: some View {
        VStack {
            Text(quiz.name)
                .font(.title.bold())

            ForEach(quiz.qnas.indices, id: \.self) { index in
                ExamQnA(qNum: index + 1, question: quiz.qnas[index].question, aCount: quiz.qnas[index].answers.count)
            }
        }

    }
}

#Preview {
    ExamQuiz(quiz: Quiz(name: "zz", qnas: [
        QnA(question: "wlfans1", answers: ["wjdekq2", "wjdekq1"]),
        QnA(question: "wlfans1", answers: ["wjdekq2", "wjdekq1", "wjdekq3"])
    ]))
}
