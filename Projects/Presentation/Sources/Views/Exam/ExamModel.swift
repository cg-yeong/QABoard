//
//  ExamModel.swift
//  Presentation
//
//  Created by root0 on 9/2/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

enum ExamState {
    case prev
    case during
    case score
}

protocol ExamModelStateProtocol {

    var contentState: ExamState { get }
    var resultScoring: [Bool] { get }
}

protocol ExamModelActionsProtocol: AnyObject {
    func changeContent(_ state: ExamState)
    func prepareExam()
    func scoreWithCompare(_ answers: [[String]])
}

/// State, Observable
final class ExamModel: ObservableObject, ExamModelStateProtocol {
    @Published var contentState: ExamState = .prev
    @Published var resultScoring: [Bool] = []
}

extension ExamModel: ExamModelActionsProtocol {
    func changeContent(_ state: ExamState) {
        contentState = state
    }

    func prepareExam() {
        contentState = .prev
    }
    
    func scoreWithCompare(_ answers: [[String]]) {
        resultScoring = Array(repeating: false, count: answers.count)
    }
}
