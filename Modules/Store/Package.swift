// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Store",
    platforms: [
        .macOS("13.0"), .iOS("13.0")
    ],
    products: [
        .library(
            name: "Store",
            targets: ["Store"]),
    ],
    dependencies: [
        .package(path: "../Core")
    ],
    targets: [
        .target(
            name: "Store",
            dependencies: [
                "Core"
            ]),
        .testTarget(
            name: "StoreTests",
            dependencies: ["Store"]),
    ]
)
