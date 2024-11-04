//
//  ExamIntent.swift
//  Presentation
//
//  Created by root0 on 9/2/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

protocol ExamIntentProtocol {
    func viewOnAppear()
    func changeContent(_ state: ExamState)
}

/// Action : Change State properties
final class ExamIntent {
    private weak var model: ExamModelActionsProtocol?

    init(model: ExamModelActionsProtocol) {
        self.model = model
    }

}

extension ExamIntent: ExamIntentProtocol {

    func viewOnAppear() {
        model?.changeContent(.prev)
    }

    func changeContent(_ state: ExamState) {
        model?.changeContent(state)
    }
}
