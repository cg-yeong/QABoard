//
//  WriteQnA.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

import DesignSystem

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

        HStack {
            Spacer()
            Button {

            } label: {
                Image(systemName: "xmark")
                    .font(.title3)
                    .tint(.white)
                    .padding(8)
                    .background(.black)
                    .clipShape(Circle())
            }
        }

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
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))

    }

    @ViewBuilder
    var answers: some View {
        ForEach(0..<numberOfAnswers, id: \.self) { numKey in
            SmallAnswer(answerNo: numKey + 1)
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

struct NewQuestion: View {
    @EnvironmentObject var theme: ThemeColor

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(Image(systemName: "plus.circle"))
                    .font(.title2.bold())
                    .foregroundColor(theme.chosen.questionNumber)

                Text("Add New Question +++")
                    .font(.title2.bold())
                    .foregroundColor(.blue)
                    .frame(minHeight: 44, maxHeight: .infinity)
                    .background(.black.opacity(0.01))
                    .asSmallAnswerEditor()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }
        .padding(.horizontal)
        .background(.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ZStack {
        Color.green.opacity(0.1).ignoresSafeArea()

        VStack {
            WriteQnA()
                .environmentObject(ThemeColor())

            NewQuestion()
                .environmentObject(ThemeColor())
        }

    }
}
