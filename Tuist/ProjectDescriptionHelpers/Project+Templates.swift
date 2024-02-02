import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

public extension Project {
    
    static let bundleID = "com.root0"
    static let iosVersion = "15.0"
    
    /// Helper function to create the Project for this ExampleApp
    static func app(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return self.project(
            name: name,
            product: .app,
            bundleID: bundleID + "\(name)",
            dependencies: dependencies,
            resources: resources
        )
    }
    
    static func module(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        packages: [Package] = [],
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default
    ) -> Project {
        return project(
            name: name,
            platform: platform,
            product: product,
            packages: packages,
            dependencies: dependencies,
            sources: sources,
            resources: resources,
            infoPlist: infoPlist
        )
    }
}

public extension Project {
    static func project(
        name: String,
        platform: Platform,
        product: Product,
        organizatinoName: String = QABoardEnv.organizationName,
        packages: [Package] = [],
        deploymentTargets: DeploymentTargets = .iOS(iosVersion),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList,
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist
    ) -> Project {
        
        let scripts: [TargetScript] = [.swiftLint]
        let settings: Settings = .settings(
            base: QABoardEnv.baseSetting,
            configurations: [.debug(name: .debug), .release(name: .release)],
            defaultSettings: .recommended
        )
        
        let appTarget = Target(
            name: name,
            destinations: .iOS,
            product: product,
            bundleId: "\(organizatinoName).\(name)",
            deploymentTargets: .iOS(iosVersion),
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: scripts,
            dependencies: dependencies
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "\(organizatinoName).\(name)Tests",
            deploymentTargets: .iOS(iosVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(appTarget)]
        )
        
        let targets: [Target] = [appTarget, testTarget]
        
        let schemes: [Scheme] = []
        return Project(
            name: name,
            organizationName: organizatinoName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

extension Project {
    public static func framework(name: String,
                                 dependencies: [TargetDependency] = [],
                                 resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return .project(name: name,
                        product: .framework,
                        bundleID: bundleID + ".\(name)",
                        dependencies: dependencies,
                        resources: resources)
    }
    
    
    
    public static func project(
        name: String,
        product: Product,
        bundleID: String,
        schemes: [Scheme] = [],
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        
        let target = Target(
            name: name,
            destinations: .iOS,
            product: product,
            bundleId: bundleID,
            deploymentTargets: .iOS(iosVersion),
            infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
            sources: ["Sources/**"],
            resources: resources,
            scripts: [.swiftLint],
            dependencies: dependencies
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "\(bundleID)Tests",
            deploymentTargets: .iOS(iosVersion),
            infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
            sources: ["Tests/**"],
            dependencies: [.target(target)]
        )
        return Project(
            name: name,
            targets: [target, testTarget],
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(["\(name)Tests"], configuration: target, options: .options(coverage: true, codeCoverageTargets: ["\(name)"])),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
            
        )
    }
}

public extension TargetDependency {
    static let rxSwift: TargetDependency         = .external(name: "RxSwift")
    static let rxCocoa: TargetDependency         = .external(name: "RxCocoa")
    static let rxRelay: TargetDependency         = .external(name: "RxRelay")
    static let rxDataSources: TargetDependency   = .external(name: "RxDataSources")
    static let alamofire: TargetDependency       = .external(name: "Alamofire")
    static let moya: TargetDependency            = .external(name: "Moya")
    static let rxMoya: TargetDependency          = .external(name: "RxMoya")
    static let snapKit: TargetDependency         = .external(name: "SnapKit")
    static let then: TargetDependency            = .external(name: "Then")
    static let kingfisher: TargetDependency      = .external(name: "Kingfisher")
    static let rxKeyboard: TargetDependency      = .external(name: "RxKeyboard")
    static let lottie: TargetDependency          = .external(name: "Lottie")
    static let rxGesture: TargetDependency       = .external(name: "RxGesture")
    static let swiftyJson: TargetDependency      = .external(name: "SwiftyJSON")
    static let realmSwift: TargetDependency         = .xcframework(path: .relativeToManifest("Framework/RealmSwift.xcframework"))
    static let realm: TargetDependency           = .xcframework(path: .relativeToManifest("Framework/Realm.xcframework"))
}
