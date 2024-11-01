//
//  Quiz.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation

public struct Quiz: Equatable, Codable {

    public var name: String
    public var qnas: [QnA]

    public var creationDate: Date?

    public init(name: String, qnas: [QnA], creationDate: Date? = nil) {
        self.name = name
        self.qnas = qnas
        self.creationDate = creationDate
    }

    public static var `default`: Self {
        Self.init(
            name: "기본 퀴즈 예시",
            qnas: [
                QnA(
                    question: "1번 질문 ?",
                    answers: [
                        "1번 소문항 답",
                        "2번 소문항 답"
                    ]
                ),
                QnA(
                    question: "2번 질문 ?",
                    answers: [
                        "1번 소문항 답",
                        "2번 소문항 답",
                        "3번 소문항 답",
                        "4번 소문항 답",
                        "5번 소문항 답"
                    ]
                )
            ],
            creationDate: .now
        )
    }

    public static var empty: Self {
        Self.init(name: "", qnas: [])
    }

    enum CodingKeys: CodingKey {
        case name
        case creationDate
        case qnas
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Quiz.CodingKeys> = try decoder.container(keyedBy: Quiz.CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: Quiz.CodingKeys.name)
        self.creationDate = try container.decodeIfPresent(Date.self, forKey: Quiz.CodingKeys.creationDate)
        self.qnas = try container.decode([QnA].self, forKey: Quiz.CodingKeys.qnas)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Quiz.CodingKeys> = encoder.container(keyedBy: Quiz.CodingKeys.self)
        
        try container.encode(self.name, forKey: Quiz.CodingKeys.name)
        try container.encodeIfPresent(self.creationDate, forKey: Quiz.CodingKeys.creationDate)
        try container.encode(self.qnas, forKey: Quiz.CodingKeys.qnas)
    }

}

public enum QuizQuery {
    case name(String)
    case contain(String, String)
}
