//
//  Quiz.swift
//  Data
//
//  Created by root0 on 2023/11/15.
//
//
//import Foundation
//import RealmSwift
//
//import Domain
//
//class QuizEntity: Object {
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted var name = ""
//    @Persisted var qnaList: List<QnAEntity>
//    @Persisted var creationAt: Date
//
//    var qnaArray: [QnAEntity] {
//        get {
//            return qnaList.map { $0 }
//        }
//        set {
//            qnaList.removeAll()
//            qnaList.append(objectsIn: newValue)
//        }
//    }
//
//    override init() {
//        super.init()
//    }
//
//    init(name: String = "", qnaList: List<QnAEntity>, creationAt: Date) {
//        self.name = name
//        self.qnaList = qnaList
//        self.creationAt = creationAt
//    }
//
//    convenience init(name: String, qnaArray: [QnAEntity], creationAt: Date) {
//        self.init()
//        self.name = name
//        self.qnaArray = qnaArray
//        self.creationAt = creationAt
//    }
//}
//
//extension QuizEntity {
//    public func toModel() -> Domain.Quiz {
//        return Domain.Quiz(
//            name: self.name,
//            creationDate: self.creationAt,
//            qnas: self.qnaArray.map { $0.toModel() }
//        )
//    }
//}
//
//extension Domain.Quiz {
//    func toEntity() -> QuizEntity {
//        return QuizEntity(
//            name: self.name,
//            qnaArray: self.qnas.map { $0.toEntity() },
//            creationAt: self.creationDate ?? Date()
//        )
//    }
//}
