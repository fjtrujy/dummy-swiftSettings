// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Goodbye",
    products: [
        .library(
            name: "Goodbye",
            targets: ["Goodbye"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Goodbye",
            dependencies: []),
    ]
)
