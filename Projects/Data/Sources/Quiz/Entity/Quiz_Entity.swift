//
//  Quiz.swift
//  Data
//
//  Created by root0 on 2023/11/15.
//

import Foundation
import RealmSwift

class Quiz_Entity: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name = ""
    @Persisted var qnaList: List<QnA_Entity>
    @Persisted var creationAt: String
    
    init(name: String = "", qnaList: List<QnA_Entity>, creationAt: String) {
        self.name = name
        self.qnaList = qnaList
        self.creationAt = creationAt
    }
}

