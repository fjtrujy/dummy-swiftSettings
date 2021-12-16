// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dummy-swiftSettings",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .executable(name: "dummy-swiftSettings", targets: ["dummy-swiftSettings"]),
    ],
    dependencies: [
        .package(path: "Goodbye"),
    ],
    targets: [
        .executableTarget(
            name: "dummy-swiftSettings",
            dependencies: ["Goodbye"],
            swiftSettings: [.define("DUMMY_FLAG")])
    ]
)
