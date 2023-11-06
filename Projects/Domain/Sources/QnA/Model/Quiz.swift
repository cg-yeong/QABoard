//
//  Quiz.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation

public struct Quiz: Equatable, Codable {
    
    public var creationDate: Date?
    public var qnas: [QnA]
    
    public init(date: Date? = nil, qnas: [QnA]) {
        self.creationDate = date
        self.qnas = qnas
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)
        self.qnas = try container.decode([QnA].self, forKey: .qnas)
    }
    
    enum CodingKeys: CodingKey {
        case creationDate
        case qnas
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.creationDate, forKey: .creationDate)
        try container.encode(self.qnas, forKey: .qnas)
    }
}
