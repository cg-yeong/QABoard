//
//  ExamContainer.swift
//  Presentation
//
//  Created by root0 on 9/2/24.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI
import Combine

/// Reducer ? ViewStoreOf ?
final class MVIContainer<Intent, Model>: ObservableObject {
    let intent: Intent
    let model: Model

    private var cBag: Set<AnyCancellable> = []

    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cBag)
    }
}
