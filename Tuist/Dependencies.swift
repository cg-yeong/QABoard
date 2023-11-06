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
            .swiftyJson,
            .realm
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
//    static let rxSwift: Package       = .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .branch("main"))
//    static let rxDataSources: Package = .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources", requirement: .branch("main"))
//    static let alamofire: Package     = .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .branch("master"))
//    static let moya: Package          = .remote(url: "https://github.com/Moya/Moya", requirement: .branch("master"))
//    static let snapKit: Package       = .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.0.1"))
//    static let then: Package          = .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "2.7.0"))
//    static let kingfisher: Package    = .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "5.15.6"))
//    static let lottie: Package        = .remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .upToNextMajor(from: "3.2.1"))
//    static let rxKeyboard: Package    = .remote(url: "https://github.com/RxSwiftCommunity/RxKeyboard", requirement: .upToNextMajor(from: "2.0.0"))
//    static let rxGesture: Package     = .remote(url: "https://github.com/RxSwiftCommunity/RxGesture", requirement: .upToNextMajor(from: "4.0.4"))
//    static let swiftyJson: Package    = .remote(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", requirement: .upToNextMajor(from: "4.0.0"))
    
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
