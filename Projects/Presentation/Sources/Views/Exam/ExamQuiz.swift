//
//  ExamQuiz.swift
//  Presentation
//
//  Created by root0 on 5/31/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

import Domain

struct ExamQuiz: View {
    @Binding var qCount: Int
    var quiz: Quiz

    init(qCount: Binding<Int>) {
        self._qCount = qCount
    }

    var body: some View {

        ForEach(0..<qCount, id: \.self) { qNum in
            ExamQnA(qNum: qNum, question: <#T##String#>, aCount: <#T##Int#>)
        }
    }
}

#Preview {
    ExamQuiz(qCount: .constant(10))
}
