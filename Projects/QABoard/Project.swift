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
    Target.target(
        name: QABoardEnv.targetName,
        destinations: [.iPhone],
        product: .app,
        bundleId: "\(QABoardEnv.organizationName).\(QABoardEnv.targetName)",
        deploymentTargets: QABoardEnv.deploymentTargets,
        infoPlist: .file(path: .relativeToRoot("Support/QABoard-Info.plist")),
        sources: [.glob(.relativeToManifest("Sources/**"))],
        resources: [
            .glob(pattern: .relativeToManifest("Resources/**"),
                  excluding: [])
        ],
        headers: nil,
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
        ),
        launchArguments: []
    ),

    Target.target(
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
    Scheme.scheme(name: "DEBUG"),
    Scheme.scheme(name: "RELEASE")
]

let project: Project = .init(
    name: QABoardEnv.targetName,
    organizationName: QABoardEnv.organizationName,
    packages: [],
    settings: settings,
    targets: targets,
    schemes: schemes
)
