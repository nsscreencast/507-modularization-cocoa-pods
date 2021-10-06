// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "WelcomeFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "WelcomeFeature",
            targets: ["WelcomeFeature"]),
    ],
    dependencies: [
        .package(path: "../Controls"),
        .package(path: "../Styleguide"),
        .package(path: "../Core"),
        .package(path: "../Store"),
    ],
    targets: [
        .target(
            name: "WelcomeFeature",
            dependencies: ["Controls", "Styleguide", "Core", "Store"]),
        .testTarget(
            name: "WelcomeFeatureTests",
            dependencies: ["WelcomeFeature"]),
    ]
)
