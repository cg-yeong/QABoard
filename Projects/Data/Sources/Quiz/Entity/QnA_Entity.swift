//
//  QnA.swift
//  Data
//
//  Created by root0 on 2023/11/15.
//

import Foundation
import RealmSwift

import Domain

enum smallAnswersKey: String, RawRepresentable {
    case one = "1."
}

class QnA_Entity: Object {
    @Persisted var question: String = ""
    @Persisted var answers: List<Answers> = .init()
    @Persisted var score: Int = 0
    
    var answerArray: [Answers] {
        get {
            return answers.map { $0 }
        } 
        set {
            answers.removeAll()
            answers.append(objectsIn: newValue)
        }
    }
    
    override init() {
        super.init()
    }
    
    init(question: String, answers: List<Answers>, score: Int) {
        self.question = question
        self.answers = answers
        self.score = score
    }
    
    convenience init(question: String, answerArray: [Answers], score: Int) {
        self.init()
        self.question = question
        self.answerArray = answerArray
        self.score = score
    }
}

class Answers: EmbeddedObject {
    @Persisted var number: Int = 0
    @Persisted var answer: String = ""
    
    init(number: Int, answer: String) {
        self.number = number
        self.answer = answer
    }
}



extension QnA_Entity {
    public func toModel() -> Domain.QnA {
        var makeDict: [Int: String] = [:]
        self.answers.forEach { makeDict[$0.number] = $0.answer }
        
        return Domain.QnA(
            question: self.question,
            answers: makeDict,
            score: self.score
        )
    }
}

extension Domain.QnA {
    func toEntity() -> QnA_Entity {
        var list: [Answers] = self.answers.map { (key: Int, value: String) in
            return Answers(number: key, answer: value)
        }
        
        return QnA_Entity(
            question: self.question,
            answerArray: list,
            score: self.score
        )
    }
}
