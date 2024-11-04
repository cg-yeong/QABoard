//
//  QnA.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation

public struct Answer: Equatable, Codable {
//    public var id: UUID = UUID()

    public var subQuestion: String = ""
    public var answer: String

    public init(subQuestion: String = "", _ answer: String) {
        self.subQuestion = subQuestion
        self.answer = answer
    }
}

public struct QnA: Equatable, Codable {

    public init(question: String, answers: [Answer], status: Int = 0) {
        self.question = question
        self.answers = answers
        self.status = status
    }

    public var question: String
    public var answers: [Answer]
    public var status: Int

    enum CodingKeys: CodingKey {
        case question
        case answers
        case status
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<QnA.CodingKeys> = try decoder.container(keyedBy: QnA.CodingKeys.self)

        self.question = try container.decode(String.self, forKey: QnA.CodingKeys.question)
        self.answers = try container.decode([Answer].self, forKey: QnA.CodingKeys.answers)
        self.status = try container.decode(Int.self, forKey: QnA.CodingKeys.status)
    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<QnA.CodingKeys> = encoder.container(keyedBy: QnA.CodingKeys.self)

        try container.encode(self.question, forKey: QnA.CodingKeys.question)
        try container.encode(self.answers, forKey: QnA.CodingKeys.answers)
        try container.encode(self.status, forKey: QnA.CodingKeys.status)
    }

    public static var empty: Self {
        Self.init(question: "", answers: [])
    }

    public static var `default`: Self {
        Self.init(question: "Q",
                  answers: [Answer("Answer 1"), Answer("Answer 2"), Answer("Answer 3"), Answer("...")])
    }

    public static var `wrongDefault`: Self {
        Self.init(question: "Q",
                  answers: [Answer("Answer 1"), Answer("Answer 2"), Answer("Answer 3"), Answer("...")],
                  status: -1)
    }

    public static var `correctDefault`: Self {
        Self.init(question: "Q",
                  answers: [Answer("Answer 1"), Answer("Answer 2"), Answer("Answer 3"), Answer("...")],
                  status: 1)
    }
}

public enum QnaQuery {
    case contents(String)
}
