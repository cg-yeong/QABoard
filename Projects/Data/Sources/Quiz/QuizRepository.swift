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

    let storage: DBHelper<QuizEntity>
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

    public func fetchQuiz(_ query: Domain.QuizQuery) -> AnyPublisher<[Domain.Quiz], Never> {
        var pub: AnyPublisher<[Domain.Quiz], Never>!

        pub = storage.read(query: query.query)
            .map { entities in entities.map { $0.toModel() } }
            .eraseToAnyPublisher()
        return pub
    }

}

extension Domain.QuizQuery {
    var query: (Query<QuizEntity>) -> Query<Bool> {
        switch self {
        case .name(let name):
            return { $0.name == name }
        case .contain(let name, _):
            return { $0.name == name }
        }
    }
}
// enum QuizQuery {
//     case quiz
//
//     var query: (Query<Quiz_Entity>) -> Query<Bool> {
//         switch self {
//         case .quiz:
//             return { $0.name == $0. }
//         }
//     }
// }

extension Domain.QnaQuery {
//    var query: (Query<[QnA_Entity]>) -> Query<Bool> {
//        switch self {
//        case .contents(let content):
////            return { $0.question.contains(content) || $0.answerArray.map { $0 } }
//            return { entities in
//                entities.forEach { $0.identifier }
//            }
//        }
//    }
}
