//
//  WriteQnA.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

enum SmallAnswersKey: String, RawRepresentable {
    case one = "①"
    case two = "②"
    case three = "③"
    case four = "④"
    case five = "⑤"
    case six = "⑥"
    case seven = "⑦"
    case eight = "⑧"
    case nine = "⑨"
    case ten = "⑩"
}

struct SmallAnswer: View {
    @Binding var key: SmallAnswersKey
    @State var answer: String = ""
    var body: some View {
        HStack {
            Text(key.rawValue)
            TextField("소문항 답", text: $answer)
                .autocorrectionDisabled()
        }
        .padding()
    }
}

struct WriteQnA: View {
    @State var number: SmallAnswersKey = .one
    var body: some View {
        VStack(alignment: .leading) {
            Text("1번 문제 문제")
            SmallAnswer(key: $number)
        }
        .background(.white)
        .padding()
    }
}

#Preview {
    WriteQnA()
        .background()
}
