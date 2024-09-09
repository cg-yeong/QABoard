//
//  WriteQuiz.swift
//  Presentation
//
//  Created by root0 on 2024/02/01.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct WriteQuiz: View {
    @State var numberOfQuestion = 1
    @State private var isEditingQuiz = false
    var body: some View {
        ScrollViewReader { _ in
            ScrollView(.vertical) {
                quiz
                Spacer()
                HStack {
                    Button(action: {
                        addQnA()
                    }, label: {
                        NewQuestion()
                    })
                }
                .padding(.horizontal)
                Button(action: {
                    isEditingQuiz.toggle()
                }, label: {
                    Text("Button")
                })
                .padding(.horizontal)
            }
        }

    }

    @ViewBuilder
    var quiz: some View {
        ForEach(0..<numberOfQuestion, id: \.self) { numKey in
            WriteQnA(numKey + 1, editMode: .constant(false))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .id(numKey)
                .wiggling(isEditingQuiz)
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
    ZStack {
        Color.green.opacity(1)
            .ignoresSafeArea()
        WriteQuiz()
    }
}
