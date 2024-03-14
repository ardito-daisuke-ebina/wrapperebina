// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "EbinaFramework",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EbinaFramework",
            targets: ["EbinaFrameworkWrapper"])    // <--- reference the wrapper here
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.7.1"),
        .package(url: "https://github.com/stasel/WebRTC.git", from: "115.0.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.6"),
        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.6.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.6.0"),
        .package(url: "https://github.com/konkab/AlamofireNetworkActivityLogger.git", from: "3.4.0"),
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.7.2"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.2.2"),
        .package(url: "https://github.com/kasketis/netfox.git", from: "1.21.0"),
        .package(url: "https://github.com/vector-im/swift-ogg.git", from: "0.0.1"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.1.0"),
        .package(url: "https://github.com/mac-cain13/R.swift.Library", from: "5.4.0")
        
        
    ],
    targets: [
        .target(
            name: "EbinaFrameworkWrapper",         // <--- new wrapper
            dependencies: [

                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "netfox", package: "netfox"),
                .product(name: "WebRTC", package: "WebRTC"),
                .product(name: "SwiftOGG", package: "swift-ogg"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "Nimble", package: "Nimble"),
                .product(name: "Starscream", package: "Starscream"),
                .product(name: "AudioKit", package: "AudioKit"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "AlamofireNetworkActivityLogger", package: "AlamofireNetworkActivityLogger"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "Rswift", package: "R.swift.Library"),
                .product(name: "KeychainAccess", package: "KeychainAccess"),
                .target(name: "EbinaFramework")    // <-- reference the actual binary target here
            ],
            path: "Sources/ebinawrapper",
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "EbinaFramework",
            path: "EbinaFramework.xcframework")
    ])
