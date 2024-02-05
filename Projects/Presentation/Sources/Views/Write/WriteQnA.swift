//
//  WriteQnA.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

import DesignSystem

protocol Answer {
    var answerNo: Int { get set }
    var answer: String { get set }
}
struct SmallAnswer: View, Answer {
    var answerNo = 1
    @State var answer: String = ""

    var removeSmallAnswer: (() -> Void)!
    init(_ answerNo: Int = 1, rmAction: @escaping (() -> Void) = {}) {
        self.answerNo = answerNo
        self.removeSmallAnswer = rmAction
    }

    var body: some View {
        HStack(alignment: .center) {
            Text(answerNo.toANumKey)
            HStack(alignment: .center) {
                TextEditor(text: $answer)
                    .transparentScrolling()
                    .font(.system(size: 14))
                    .frame(minHeight: 36, maxHeight: 80)
                    .foregroundColor(.black)
                    .asSmallAnswerEditor()
                if !answer.isEmpty {
                    Button(action: {
                        answer = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    })
                }
            }
            .background(.brown.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
//        .padding(.leading)
    }
}

struct WriteQnA: View {
    @EnvironmentObject var theme: ThemeColor
    var questionNumber = 1
    @State var question = ""
    @State var number: AnswerNumberKey = .one
    @State var numberOfAnswers = 1

    init(_ questionNumber: Int = 1) {
        self.questionNumber = questionNumber
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(questionNumber.toQNumkey)
                    .font(.title.bold())
                    .foregroundColor(theme.chosen.questionNumber)
                TextEditor(text: $question)
                    .transparentScrolling()
                    .font(.title2.bold())
                    .foregroundColor(.blue)
                    .frame(minHeight: 44, maxHeight: .infinity)
                    .background(question.isEmpty ? .black.opacity(0.05) : .black.opacity(0.01))
                    .asSmallAnswerEditor()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .scrollIndicators(.hidden)

            }

            answers
                .padding(.leading)
        }
        .background(.white)
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 8))

    }

    @ViewBuilder
    var answers: some View {
        ForEach(0..<numberOfAnswers, id: \.self) { numKey in
            SmallAnswer(numKey + 1, rmAction: minusSmallAnswer)
        }
    }

    func addSmallAnswer() {
        print("소문항 답 추가")
        numberOfAnswers += 1
    }

    func minusSmallAnswer() {
        guard numberOfAnswers > 1 else {
            return
        }
        print("소문항 답 제거")
        numberOfAnswers -= 1
    }
}

#Preview {
    WriteQnA()
        .environmentObject(ThemeColor())
        .background(Color.gray)
}
