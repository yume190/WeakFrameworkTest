// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

var package = Package(
    name: "WeakFramework",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        // .library(
        //     name: "WeakFramework",
        //     targets: ["WeakFramework"]),
    ],
    dependencies: [
        .package(path: "WeakDep"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Exe",
            dependencies: [
               "WeakFramework"
            ]
        ),
        .target(
            name: "WeakFramework",
            dependencies: [
                .product(name: "WeakDep", package: "WeakDep"),
            ]
        ),
    ]
)

if ProcessInfo.processInfo.environment["WEAK_LINK"] != nil {
    package.dependencies = []
    package.targets = [
        .executableTarget(
            name: "Exe",
            dependencies: [
                // "WeakFramework"
                "WeakDep1",
                "WeakDep2",
            ]
        ),
        // .target(
        //     name: "WeakFramework",
        //     dependencies: [
        //         "WeakDep1",
        //         "WeakDep2",
        //     ]
        // ),
       
        .binaryTarget(
            name: "WeakDep1",
            path: "XCFrameworks/WeakDep1.xcframework"
        ),
        .binaryTarget(
            name: "WeakDep2",
            path: "XCFrameworks/WeakDep2.xcframework"
        ),
    ]
}

private func patchToUsePrebuiltXcframeworks(in package: inout Package) {
    func patchMacro(_ target: Target, _ macro: String) {
        var settings = target.swiftSettings ?? []
        settings.append(.unsafeFlags([
            "-load-plugin-executable", "XCFrameworks/\(macro)#\(macro)"
        ]))
        target.swiftSettings = settings
    }

#if os(macOS)
    if ProcessInfo.processInfo.environment["USE_PREBUILT"] != nil {
        package.dependencies = [
            .package(path: "XCFrameworks/packages/WeakDep"),
        ]
        for target in package.targets {

        }
    }
#endif
}
patchToUsePrebuiltXcframeworks(in: &package)