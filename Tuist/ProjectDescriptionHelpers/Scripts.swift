//
//  Scripts.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2024/01/30.
//

import Foundation
import ProjectDescription

public extension TargetScript {
    static let swiftLint: TargetScript = .pre(
        path: .relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLintShell",
        basedOnDependencyAnalysis: false
    )
}
