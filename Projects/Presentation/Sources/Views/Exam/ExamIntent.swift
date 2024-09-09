//
//  ExamIntent.swift
//  Presentation
//
//  Created by root0 on 9/2/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

final class ExamIntent {
    private weak var model: ExamModelActionsProtocol?

    init(model: ExamModelActionsProtocol) {
        self.model = model
    }

    func viewOnAppear() {
//        model?.scoreWithCompare(<#T##answers: [[String]]##[[String]]#>)
    }
}
