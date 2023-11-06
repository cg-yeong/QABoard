//
//  QuizRepository.swift
//  Data
//
//  Created by root0 on 2023/11/06.
//

import Foundation
import Domain
import Combine

public class QuizRepository: Domain.QuizRepositoryProtocol {
    
    
    public init() {
        
    }
    
    
    public func saveQuiz(data: Domain.Quiz) -> Future<Domain.Quiz, Error> {
        let future: Future<Domain.Quiz, Error>!
        // DB Process
        future = Future() { promise in
            promise(.success(Quiz(date: Date(), qnas: [])))
        }
        return future
    }
}
