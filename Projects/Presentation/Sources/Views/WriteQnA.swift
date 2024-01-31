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

    init(_ answerNo: Int = 1) {
        self.answerNo = answerNo
    }

    var body: some View {
        HStack(alignment: .center) {
            Text(answerNo.toANumKey)
            TextEditor(text: $answer)
                .font(.system(size: 12))
                .frame(minHeight: 36, maxHeight: 80)
                .foregroundColor(.black)
                .asSmallAnswerEditor()
        }
        .padding(.leading)
        .background(.brown.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct WriteQnA: View {
    @State var number: AnswerNumberKey = .one
    @State var numberOfAnswers = 1

    var body: some View {
        VStack(alignment: .leading) {
            Text("01. \(1.toANumKey) 안녕하세요안녕하세요2안녕하세요3안녕하세요4, \(2.toANumKey) 헬로우잇츠미아델헬로 의 답은 ?")
                .font(.title2).bold()
                .foregroundStyle(Color.blue.opacity(0.7))
            answers
            Button(action: {
                addSmallAnswer()
            }, label: {
                Spacer()
                Image(systemName: "plus.circle")
                    .tint(.brown)
                Spacer()
            })
            .padding()
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()

    }

    @ViewBuilder
    var answers: some View {
        ForEach(0..<numberOfAnswers, id: \.self) { numKey in
            SmallAnswer(numKey + 1)
        }
    }

    func addSmallAnswer() {
        print("소문항 답 추가")
        numberOfAnswers += 1
    }
}

#Preview {
    WriteQnA()
        .background()
}
