//
//  Envirionment.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2024/01/30.
//

import ProjectDescription

public enum QABoardEnv {
    public static let appName = "QABoard"
    public static let targetName = "QABoard"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "com.raoot0"
    public static let deploymentTargets: DeploymentTargets = .iOS("15.0")
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
        .marketingVersion("1.0.0")
        .currentProjectVersion("0")
        .debugInformationFormat(.dwarfWithDsym)
        .otherLinkerFlags(["-Objc"])
        .bitcodeEnabled(false)
}
