//
//  ExamQnA.swift
//  Presentation
//
//  Created by root0 on 5/31/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI
import DesignSystem

struct ExamQnA: View {
    
    var qNum = 1
    var question = ""
    var aCount = 1

    init(qNum: Int = 1,
         question: String = "",
         aCount: Int = 1) {
        self.qNum = qNum
        self.question = question
        self.aCount = aCount
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(qNum.toQNumkey)
                    .font(.title2.bold())
                    .foregroundStyle(Theme.yeong.questionNumber)

                Text(question)
                    .font(.title3.bold())
            }

            setAnswers(count: aCount)
        }
        .padding()
    }

    func setAnswers(count answers: Int) -> some View {
        ForEach(0..<answers, id: \.self) { aNum in
            SmallAnswer(answerNo: aNum + 1, subTitle: "")
        }
    }
}

#Preview {
    ExamQnA(
        qNum: 1,
        question: "안녕하세요 오늘 날짜는? ㅋㅋ",
        aCount: 5
    )
}
