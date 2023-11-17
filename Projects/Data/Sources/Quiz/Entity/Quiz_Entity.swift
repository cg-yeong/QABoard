//
//  Quiz.swift
//  Data
//
//  Created by root0 on 2023/11/15.
//

import Foundation
import RealmSwift

import Domain

class Quiz_Entity: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name = ""
    @Persisted var qnaList: List<QnA_Entity>
    @Persisted var creationAt: Date
    
    var qnaArray: [QnA_Entity] {
        get {
            return qnaList.map { $0 }
        }
        set {
            qnaList.removeAll()
            qnaList.append(objectsIn: newValue)
        }
    }
    
    override init() {
        super.init()
    }
    
    init(name: String = "", qnaList: List<QnA_Entity>, creationAt: Date) {
        self.name = name
        self.qnaList = qnaList
        self.creationAt = creationAt
    }
    
    convenience init(name: String, qnaArray: [QnA_Entity], creationAt: Date) {
        self.init()
        self.name = name
        self.qnaArray = qnaArray
        self.creationAt = creationAt
    }
}

extension Quiz_Entity {
    public func toModel() -> Domain.Quiz {
        return Domain.Quiz(
            name: self.name,
            creationDate: self.creationAt,
            qnas: self.qnaArray.map { $0.toModel() }
        )
    }
}

extension Domain.Quiz {
    func toEntity() -> Quiz_Entity {
        return Quiz_Entity(
            name: self.name,
            qnaArray: self.qnas.map { $0.toEntity() },
            creationAt: self.creationDate ?? Date()
        )
    }
}

