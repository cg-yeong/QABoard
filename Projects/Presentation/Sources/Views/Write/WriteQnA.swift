//
//  WriteQnA.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct SmallAnswer: View {
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
            TextEditor(text: $answer)
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
        .padding(.leading)
        .background(.brown.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct WriteQnA: View {
    var questionNumber = 1
    @State var question = ""
    @State var number: AnswerNumberKey = .one
    @State var numberOfAnswers = 1

    init(_ questionNumber: Int = 1) {
        self.questionNumber = questionNumber
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(questionNumber.toQNumkey)
                .font(.title3.bold())
            TextEditor(text: $question)
                .font(.title2.bold())
                .foregroundColor(.blue)
                .frame(minHeight: 44, maxHeight: .infinity)
                .background(question.isEmpty ? .black.opacity(0.05) : .black.opacity(0.01))
                .asSmallAnswerEditor()
                .clipShape(RoundedRectangle(cornerRadius: 10))

            answers

            HStack {
                Button(action: {
                    addSmallAnswer()
                }, label: {
                    Spacer()
                    Image(systemName: "plus.circle")
                        .tint(.brown)
                    Spacer()
                })

                Button(action: {
                    minusSmallAnswer()
                }, label: {
                    Spacer()
                    Image(systemName: "minus.circle")
                        .tint(.brown)
                    Spacer()
                })
            }
            .padding()
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal)

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
}
