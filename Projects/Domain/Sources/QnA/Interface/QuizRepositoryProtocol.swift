//
//  QuizRepositoryProtocol.swift
//  Domain
//
//  Created by root0 on 2023/11/06.
//

import Foundation
import Combine

public protocol QuizRepositoryProtocol {

    func saveQuiz(data: Domain.Quiz) -> AnyPublisher<Domain.Quiz, Error>

    func fetchQuiz(_ query: QuizQuery) -> AnyPublisher<[Domain.Quiz], Never>
}
