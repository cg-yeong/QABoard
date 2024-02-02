//
//  Theme.swift
//  DesignSystem
//
//  Created by root0 on 2024/02/02.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

public protocol ThemeProperties {
    var questionNumber: Color { get }
    var question: Color { get }
    var score: Color { get }
    var answerNumber: Color { get }
    var answerNumberBackground: Color { get }
    var answer: Color { get }
    var correctAnswer: Color { get }
}

public enum Theme: ThemeProperties {

    case `default`
    case yeong

    public var questionNumber: Color {
        switch self {
        case .default: Color(redF: 0, greenF: 0, blueF: 139)
        case .yeong: Color(hex: "004491")
        }
    }

    public var question: Color {
        switch self {
        case .default: .black
        case .yeong: .black
        }
    }

    public var score: Color {
        switch self {
        case .default: .cyan
        case .yeong: Color(hex: "#019cc8")
        }
    }

    public var answerNumber: Color {
        switch self {
        case .default: .white
        case .yeong: .white
        }
    }

    public var answerNumberBackground: Color {
        switch self {
        case .default: .gray
        case .yeong: Color(hex: "#d5d5d5")
        }
    }

    public var answer: Color {
        switch self {
        case .default: .black
        case .yeong: Color(hex: "#222222")
        }
    }

    public var correctAnswer: Color {
        switch self {
        case .default: .black
        case .yeong: Color(hex: "#222222")
        }
    }
}
