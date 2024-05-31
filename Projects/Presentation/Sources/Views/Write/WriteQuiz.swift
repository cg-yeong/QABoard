//
//  WriteQuiz.swift
//  Presentation
//
//  Created by root0 on 2024/02/01.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct WriteQuiz: View {
    @EnvironmentObject var theme: ThemeColor
    @State var numberOfQuestion = 1

    var body: some View {
        ScrollViewReader { _ in
            ScrollView(.vertical) {
                Spacer()
                quiz
                HStack {
                    Button(action: {
                        addQnA()
                    }, label: {
                        Spacer()
                        Image(systemName: "plus.circle")
                            .tint(.indigo)
                        Spacer()
                    })

                    Button(action: {
                        subsQnA()
                    }, label: {
                        Spacer()
                        Image(systemName: "minus.circle")
                            .tint(.indigo)
                        Spacer()
                    })
                }
                .padding(.horizontal)
            }
        }

    }

    @ViewBuilder
    var quiz: some View {
        ForEach(0..<numberOfQuestion, id: \.self) { numKey in
            WriteQnA(numKey + 1)
                .padding(.vertical)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .id(numKey)
        }
    }

    func addQnA() {
        print("질문과 답 추가")
        numberOfQuestion += 1
    }

    func subsQnA() {
        guard numberOfQuestion > 1 else {
            return
        }
        print("질문과 답 제거")
        numberOfQuestion -= 1
    }
}

#Preview {
    WriteQuiz()
        .background(.green)
        .environmentObject(ThemeColor())
}
