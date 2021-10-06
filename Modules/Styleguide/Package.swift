// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Styleguide",
    platforms: [.iOS("14.0")],
    products: [
        .library(
            name: "Styleguide",
            targets: ["Styleguide"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Styleguide",
            dependencies: []
        ),
        .testTarget(
            name: "StyleguideTests",
            dependencies: ["Styleguide"]),
    ]
)
