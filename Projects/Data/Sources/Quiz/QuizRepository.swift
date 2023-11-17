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
    
    deinit {
        cancelBag = .init()
    }
    
    public func saveQuiz(data: Domain.Quiz) -> AnyPublisher<Domain.Quiz, Error> {
        
        var pub: AnyPublisher<Domain.Quiz, Error>!
        storage
            .read { $0.name == "" }
            .map { $0 }
            .sink { [weak self] quizzes in
                guard let self = self else { return }
                if quizzes.isEmpty {
                    // save
                    let entity = data.toEntity()
                    pub = self.storage.add(entity).map { $0.toModel() }.eraseToAnyPublisher()

                } else {
                    // update
                    guard let quiz = quizzes.first else {
                        print("quiz가 왜 없지???")
                        return
                    }
                    
                    let updateEntity = data.toEntity()
                    updateEntity.id = quiz.id
                    pub = self.storage.update(updateEntity).map { $0.toModel() }.eraseToAnyPublisher()
                    
                }
            }
            .store(in: &cancelBag)
        
        return pub
    }
    
}
