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
        .package(url: "https://github.com/ardito-daisuke-ebina/swift-ogg.git", from: "0.8.0"),
        .package(url: "https://github.com/element-hq/opus-swift.git", from: "0.8.4"),
        .package(url: "https://github.com/element-hq/ogg-swift.git", from: "0.8.3"),
        
        
    ],
    targets: [
        .target(
            name: "EbinaFrameworkWrapper",         // <--- new wrapper
            dependencies: [

                .product(name: "Copustools", package: "swift-ogg"),
                .product(name: "YbridOpus", package: "opus-swift"),
                .product(name: "YbridOgg", package: "ogg-swift"),
                .target(name: "EbinaFramework")    // <-- reference the actual binary target here
            ],
            path: "Sources/ebinawrapper",
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "EbinaFramework",
            path: "EbinaFramework.xcframework")
    ])
