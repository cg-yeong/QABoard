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
    var questionNumber = 1
    @State var question = ""
    @State var number: AnswerNumberKey = .one
    @State var numberOfAnswers = 1

    @Binding var editMode: Bool

    init(_ questionNumber: Int = 1,
         editMode: Binding<Bool>) {
        self.questionNumber = questionNumber
        self._editMode = editMode
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(questionNumber.toQNumkey)
                    .font(.title.bold())
                    .foregroundColor(Color(redF: 0, greenF: 0, blueF: 139))
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
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(alignment: .topTrailing) {
            if editMode {
                Button {

                } label: {
                    Image(systemName: "minus")
                        .font(.body)
                        .tint(.primary)
                        .padding(12)
                        .background(.ultraThickMaterial)
                        .clipShape(Circle())
                }
            }

        }

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

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(Image(systemName: "plus.circle"))
                    .font(.title2.bold())
                    .foregroundColor(Color(redF: 0, greenF: 0, blueF: 139))

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
            WriteQnA(editMode: .constant(true))

            NewQuestion()
        }

    }
}
