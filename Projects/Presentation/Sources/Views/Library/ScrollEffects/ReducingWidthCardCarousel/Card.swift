//
//  Card.swift
//  Presentation
//
//  Created by root0 on 2024/02/02.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

/// Card Model
struct Card: Identifiable, Hashable, Equatable {
    var id: UUID = .init()
    var image: String
    var previousOffset: CGFloat = 0
}
