//
//  MemorizeCard.swift
//  Presentation
//
//  Created by root0 on 9/24/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI
import Domain
import DesignSystem

struct MemorizeCard: View {

    var qna: QnA

    init(qna: QnA = .empty) {
        self.qna = qna
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Q")
                    .font(.title2.bold())
                    .foregroundStyle(Theme.yeong.questionNumber)

                Text(qna.question)
                    .font(.title3.bold())
                    .foregroundStyle(.black)
            }


            ForEach(qna.answers.indices, id: \.self) { index in


                HStack(alignment: .center) {
                    Text((index + 1).toANumKey)
                        .foregroundStyle(.black)

                    // answer label
                    HStack(alignment: .center) {
                        Text(qna.answers[index])
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, minHeight: 36, alignment: .leading)
                            .foregroundColor(.black)
                            .padding(.leading)

                        Button {

                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                    }
                    .background(.brown.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }

            }
        }
        .background(.white)
    }
}

#Preview {
    MemorizeCard(qna: .default)
}
