//
//  Dependencies.swift
//  Config
//
//  Created by cheonsong on 2022/09/05.
//

import ProjectDescription

let dependencies = Dependencies(
    carthage: [],
//    swiftPackageManager: [
//            .rxSwift,
//            .rxDataSources,
//            .alamofire,
//            .moya,
//            .snapKit,
//            .then,
//            .kingfisher,
//            .lottie,
//            .rxKeyboard,
//            .rxGesture,
//            .swiftyJson
//    ],
    swiftPackageManager: .init(
        [
            .alamofire,
            .moya,
            .snapKit,
            .then,
            .kingfisher,
            .swiftyJson
        ],
        baseSettings: .settings(
            base: [
                "IPHONEOS_DEPLOYMENT_TARGET" : .string("14.0")
            ],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ]
        )
        
    ),
    platforms: [.iOS]
)

public extension Package {
    static let rxSwift: Package = .package(url: "https://github.com/ReactiveX/RxSwift.git", .branch("main"))
    static let rxDataSources: Package = .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .branch("main"))
    static let alamofire: Package = .package(url: "https://github.com/Alamofire/Alamofire.git", .branch("master"))
    static let moya: Package = .package(url: "https://github.com/Moya/Moya.git", .branch("master"))
    static let snapKit: Package = .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.6.0"))
    static let then: Package = .package(url: "https://github.com/devxoul/Then.git", .upToNextMajor(from: "3.0.0"))
    static let kingfisher: Package = .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0"))
    static let swiftyJson: Package = .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "5.0.0"))
    static let rxRealm: Package = .package(url: "https://github.com/RxSwiftCommunity/RxRealm.git", .upToNextMajor(from: "5.0.6"))
    static let realm: Package = .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.44.0"))
}
