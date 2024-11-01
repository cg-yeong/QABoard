//
//  QnA.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation

public struct QnA: Equatable, Codable {

    public init(question: String, answers: [String]) {
        self.question = question
        self.answers = answers
    }

    public var question: String
    public var answers: [String]

    enum CodingKeys: CodingKey {
        case question
        case answers
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<QnA.CodingKeys> = try decoder.container(keyedBy: QnA.CodingKeys.self)

        self.question = try container.decode(String.self, forKey: QnA.CodingKeys.question)
        self.answers = try container.decode([String].self, forKey: QnA.CodingKeys.answers)

    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<QnA.CodingKeys> = encoder.container(keyedBy: QnA.CodingKeys.self)

        try container.encode(self.question, forKey: QnA.CodingKeys.question)
        try container.encode(self.answers, forKey: QnA.CodingKeys.answers)
    }

    public static var empty: Self {
        Self.init(question: "", answers: [])
    }

    public static var `default`: Self {
        Self.init(question: "Q", answers: ["Answer 1", "Answer 2", "Answer 3", "..."])
    }
}


public enum QnaQuery {
    case contents(String)
}
