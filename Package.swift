// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCAReducerGraphPlugin",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "TCAReducerGraphPlugin",
            type: .dynamic,
            targets: ["TCAReducerGraphPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/maxchuquimia/XCGrapherPluginSupport.git", from: "0.0.6")
    ],
    targets: [
        .target(
            name: "TCAReducerGraphPlugin",
            dependencies: [
                .product(name: "XCGrapherPluginSupport", package: "XCGrapherPluginSupport")
            ]),
        .testTarget(
            name: "TCAReducerGraphPluginTests",
            dependencies: ["TCAReducerGraphPlugin"])
    ]
)
