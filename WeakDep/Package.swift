// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeakDep",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WeakDep",
//            type: .dynamic,
            targets: ["WeakDep2"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "WeakDep1"),
        .target(
            name: "WeakDep2",
            dependencies: [
                "WeakDep1",
            ]
        ),

    ]
)
