//
//  Quiz.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation

public struct Quiz: Equatable, Codable {
    
    public var name: String
    public var creationDate: Date?
    public var qnas: [QnA]
    
    enum CodingKeys: CodingKey {
        case name
        case creationDate
        case qnas
    }
    
    public init(name: String, creationDate: Date? = nil, qnas: [QnA]) {
        self.name = name
        self.creationDate = creationDate
        self.qnas = qnas
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
