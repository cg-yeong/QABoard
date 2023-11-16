//
//  QuizRepository.swift
//  Data
//
//  Created by root0 on 2023/11/06.
//

import Foundation
import Domain
import Combine
import RealmSwift

public class QuizRepository: Domain.QuizRepositoryProtocol {
    
    let storage: DBHelper<Quiz_Entity>
    private var cancelBag: Set<AnyCancellable>!
    
    public init() {
        self.storage = .init()
        self.cancelBag = .init()
    }
    
    
    public func saveQuiz(data: Domain.Quiz) -> Future<Domain.Quiz, Error> {
        var domainFuture: Future<Domain.Quiz, Error>
        storage
            .read { $0.name == "" }
            .sink { [weak self] quizzes in
                guard let self = self else { return }
                if quizzes.isEmpty {
                    // save
//                    let entity = Quiz_Entity(name: <#T##String#>, qnaList: <#T##List<QuestionAndAnswers>#>, creationAt: <#T##String#>)//data.toentity()
//                    let asd = self.storage.add(entity).sink { _ in
//                        
//                    } receiveValue: { rquiz in
//                        
//                    }

                } else {
                    // update
                }
            }
            .store(in: &cancelBag)
        
        let future: Future<Domain.Quiz, Error>!
        // DB Process
        
        future = Future() { promise in
//            promise(.success(Quiz(date: Date(), qnas: [])))
        }
        return future
    }
    
}
