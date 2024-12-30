// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Template",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]
        ),
        .library(
            name: "Details",
            targets: ["Details"]
        ),
        .library(
            name: "Resources",
            targets: ["Resources"]
        ),
    ],
    dependencies: [
        // A library for building applications in a consistent and understandable way, with composition,
        // testing, and ergonomics in mind.
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.11.0"
        ),
        // A library for snapshot testing in Swift
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.1.0"
        ),
        // A library for mocking dependencies in Swift
        .package(
            url: "https://github.com/pointfreeco/xctest-dynamic-overlay",
            from: "1.0.0"
        ),
        // Safely access Apple's SF Symbols using static typing
        .package(
            url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git",
            from: "5.3.0"
        ),
        // Inject - for hot reloading during development
        .package(
            url: "https://github.com/krzysztofzablocki/Inject.git",
            exact: "1.5.2"
        ),
    ],

    targets: [
        .target(
            name: "App",
            dependencies: [
                "Details",
                "Resources",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .target(
            name: "Details",
            dependencies: [
                "Resources",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .target(
            name: "Resources",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
            ]
        ),

        // MARK: - Tests targets

        .testTarget(
            name: "AppTests",
            dependencies: ["App"]
        ),
    ]
)
