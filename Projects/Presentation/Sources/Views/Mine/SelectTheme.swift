//
//  SelectTheme.swift
//  Presentation
//
//  Created by root0 on 2024/02/02.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI
import DesignSystem

public class ThemeColor: ObservableObject {
    @Published var chosen: Theme = .yeong

    public init(theme: Theme = .yeong) {
        self.chosen = theme
    }
}
