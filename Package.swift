// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "SwiftyJSON" : .framework,
            "SnapKit" : .framework,
            "Then" : .framework,
        ],
        baseSettings: .settings(base: ["IPHONEOS_DEPLOYMENT_TARGET": .string("16.0")])
    )
#endif
let package = Package(
    name: "Package",
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.6.0"),
        .package(url: "https://github.com/devxoul/Then.git", from: "3.0.0"),
//        .package(url: "https://github.com/realm/realm-swift.git", from: "10.44.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/Moya/Moya.git", branch: "master")
    ]
)
