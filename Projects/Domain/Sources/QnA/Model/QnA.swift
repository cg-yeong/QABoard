//
//  QnA.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation

public struct QnA: Equatable, Codable {
    
    public var question: String
    public var answers: [Int: String]
    
    public init(question: String, answers: [Int: String]) {
        self.question = question
        self.answers = answers
    }
    
    enum CodingKeys: CodingKey {
        case question
        case answers
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.question, forKey: .question)
        try container.encode(self.answers, forKey: .answers)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.question = try container.decode(String.self, forKey: .question)
        self.answers = try container.decode([Int: String].self, forKey: .answers)
    }
}

public enum QnaQuery {
    case contents(String)
}
