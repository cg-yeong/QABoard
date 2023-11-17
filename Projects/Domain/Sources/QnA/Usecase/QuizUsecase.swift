//
//  QuizUsecase.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation
import Combine

public protocol AddQuizUsecaseProtocol {
    func write(data: Quiz) -> AnyPublisher<Quiz, Error>
}
public protocol QuizUsecaseProtocol: AddQuizUsecaseProtocol {}

public class QuizUsecase: QuizUsecaseProtocol {
    
    var repository: QuizRepositoryProtocol
    
    public init(repository: QuizRepositoryProtocol) {
        self.repository = repository
    }
    
    public func write(data: Quiz) -> AnyPublisher<Quiz, Error> {
        return repository.saveQuiz(data: data)
    }
    
    
    
    
}
