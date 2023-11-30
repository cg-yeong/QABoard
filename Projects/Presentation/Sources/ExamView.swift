//
//  ExamView.swift
//  Presentation
//
//  Created by raoot0 on 11/29/23.
//

import SwiftUI
import Domain

/// AnswerView? .Modifier Answer?


struct AnswerView: View {
    var text: String
    var backgroundColor: Color = .gray
    
    var body: some View {
        ZStack {
            Text(text)
                .background()
                .padding()
        }
        .background(backgroundColor)
        
    }
    
}

struct QuestionAnswersView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("0N. Question ???")
            Divider()
            AnswerView(text: "01- Answer 1")
            AnswerView(text: "01- Answer 2")
            AnswerView(text: "01- Answer 3")
        }
        .background(.brown)
        .padding()
        
    }
}

struct QuizView: View {
    
    var quiz: Domain.Quiz
    
    var body: some View {
        Text("01. ABC의 C다C 게임은 ?")
        Text("01 - 1 번의 답")
        
    }
    
    func getQnA(quiz: Quiz) {
        let qnas = quiz.qnas
        qnas.forEach { qna in
//            qna.
        }
    }
}

struct ExamView: View {
    var body: some View {
        Text("exam")
    }
}

#Preview {
//    ExamView()
//    QuizView(quiz: Quiz.default)
    QuestionAnswersView()
}
