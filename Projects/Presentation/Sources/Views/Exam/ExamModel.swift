//
//  ExamModel.swift
//  Presentation
//
//  Created by root0 on 9/2/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

protocol ExamModelStateProtocol {

    var resultScoring: [Bool] { get }
}

protocol ExamModelActionsProtocol: AnyObject {
    func scoreWithCompare(_ answers: [[String]])
}

final class ExamModel: ObservableObject, ExamModelStateProtocol {
    @Published var resultScoring: [Bool] = []
}

extension ExamModel: ExamModelActionsProtocol {
    func scoreWithCompare(_ answers: [[String]]) {
        resultScoring = Array(repeating: false, count: answers.count)
    }
}
