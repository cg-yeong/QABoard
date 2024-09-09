//
//  QnAKeys.swift
//  Presentation
//
//  Created by root0 on 2024/01/31.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import Foundation

enum AnswerNumberKey: Int, RawRepresentable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10

    // swiftlint:disable:next cyclomatic_complexity
    init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .one
        case 2: self = .two
        case 3: self = .three
        case 4: self = .four
        case 5: self = .five
        case 6: self = .six
        case 7: self = .seven
        case 8: self = .eight
        case 9: self = .nine
        case 10: self = .ten
        default: return nil
        }
    }
    var key: String {
        switch self {
        case .one: return "①" //U+2460 ~ 20: 2473
        case .two: return "②" // U+2461
        case .three: return "③"
        case .four: return "④"
        case .five: return "⑤"
        case .six: return "⑥"
        case .seven: return "⑦"
        case .eight: return "⑧"
        case .nine: return "⑨"
        case .ten: return "⑩"
        }
    }
}
