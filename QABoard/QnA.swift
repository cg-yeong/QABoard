//
//  QnA.swift
//  QABoard
//
//  Created by raoot0 on 11/2/23.
//

import UIKit

/**
 문제 유형
 1. 객관식 (정답 하나)
 2. 빈칸채우기
 3. 산출식
 */
enum QnAType {
    case multiChoice
    case descriptive
}

struct QnA: Encodable {
    var question: String
    var answer: [String]
    var type: QnAType
    
    
    enum CodingKeys: String, CodingKey {
        case question
        case answer
        case type
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(question, forKey: .question)
        try container.encode(answer, forKey: .answer)
//        try container.encode(type, forKey: .type)
    }
}
