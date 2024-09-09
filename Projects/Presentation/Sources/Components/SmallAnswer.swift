//
//  SmallAnswer.swift
//  Presentation
//
//  Created by root0 on 5/31/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

protocol Answer {
    var answerNo: Int { get set }
    var answer: String { get set }
}

struct SmallAnswer: View, Answer {

    var answerNo = 1
    var subTitle: String = ""
    @State var answer: String = ""

    init(answerNo: Int = 1,
         subTitle: String = "",
         answer: String = "") {
        self.answerNo = answerNo
        self.subTitle = subTitle
        self.answer = answer
    }

    var body: some View {
        HStack(alignment: subTitle.isEmpty ? .center : .top) {
            Text(answerNo.toANumKey)
                .foregroundColor(.black)

            VStack(alignment: .leading, spacing: 0) {
                if !subTitle.isEmpty {
                    Text(subTitle)
                }
                answerField
            }
        }
        .background(.white)
    }

    @ViewBuilder
    var answerField: some View {
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
}

#Preview {
    SmallAnswer()
}
