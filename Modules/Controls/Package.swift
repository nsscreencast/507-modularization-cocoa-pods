// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Controls",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Controls",
            targets: ["Controls"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", .upToNextMajor(from: "5.0.1")),
        .package(path: "../Styleguide"),
    ],
    targets: [
        .target(
            name: "Controls",
            dependencies: ["Styleguide", "SnapKit"]),
        .testTarget(
            name: "ControlsTests",
            dependencies: ["Controls"]),
    ]
)
