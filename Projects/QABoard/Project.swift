import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.app(
//     name: "QABoard",
//     dependencies: [
//         Module.domain,
//         Module.data,
//         Module.presentation,
//         Module.designSystem
//     ].map(\.project),
//     resources: .default
// )

let settings: Settings = .settings(
    base: QABoardEnv.baseSetting,
    configurations: [
        .debug(name: .debug),
        .release(name: .release)
    ],
    defaultSettings: .recommended
)

let scripts: [TargetScript] = [.swiftLint]

let targets: [Target] = [
    Target(
        name: QABoardEnv.targetName,
        destinations: .iOS,
        product: .app,
        productName: QABoardEnv.appName,
        bundleId: "\(QABoardEnv.organizationName).\(QABoardEnv.targetName)",
        deploymentTargets: QABoardEnv.deploymentTargets,
        infoPlist: .file(path: .relativeToRoot("Support/Info.plist")),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        entitlements: .file(path: .relativeToRoot("Support/\(QABoardEnv.appName).entitlements")),
        scripts: scripts,
        dependencies: [
            Module.domain.project,
            Module.data.project,
            Module.presentation.project,
            Module.designSystem.project
        ],
        settings: .settings(
            base: QABoardEnv.baseSetting,
            configurations: [.debug(name: .debug), .release(name: .release)]
        )
    ),

    Target(
        name: QABoardEnv.targetTestName,
        destinations: .iOS,
        product: .unitTests,
        bundleId: "\(QABoardEnv.organizationName).\(QABoardEnv.targetName)Tests",
        deploymentTargets: QABoardEnv.deploymentTargets,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [.target(name: QABoardEnv.targetName, condition: nil)]
    )
]

let schemes: [Scheme] = [
    .init(
        name: "\(QABoardEnv.targetName)-DEBUG",
        shared: true,
        buildAction: .buildAction(targets: ["\(QABoardEnv.targetName)"]),
        testAction: .targets(["\(QABoardEnv.targetName)"]),
        runAction: .runAction(configuration: .debug),
        archiveAction: .archiveAction(configuration: .debug),
        profileAction: .profileAction(configuration: .debug),
        analyzeAction: .analyzeAction(configuration: .debug)
    ),
    .init(
        name: "\(QABoardEnv.targetName)-RELEASE",
        shared: true,
        buildAction: .buildAction(targets: ["\(QABoardEnv.targetName)"]),
        testAction: nil,
        runAction: .runAction(configuration: .debug),
        archiveAction: .archiveAction(configuration: .release),
        profileAction: .profileAction(configuration: .release),
        analyzeAction: .analyzeAction(configuration: .release)
    )
]

let project: Project = .init(
    name: QABoardEnv.targetName,
    organizationName: QABoardEnv.organizationName,
    packages: [],
    settings: settings,
    targets: targets,
    schemes: schemes
)
