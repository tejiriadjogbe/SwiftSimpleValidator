// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleValidator",
    products: [
        .library(
            name: "SimpleValidator",
            targets: ["SimpleValidator"]),
    ],
    targets: [
        .target(
            name: "SimpleValidator"),
        .testTarget(
            name: "SimpleValidatorTests",
            dependencies: ["SimpleValidator"]),
    ]
)
