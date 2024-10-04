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
        .library(
            name: "WeakFramework",
            targets: ["WeakFramework"]),
    ],
    dependencies: [
        //  .package(path: "../WeakDep"),
//        .package(path: "../WeakDep2"),

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
                    //  .product(name: "WeakDep", package: "WeakDep"),
//                    .product(name: "WeakDep2", package: "WeakDep2"),
                   "WeakDep1",
                   "WeakDep2",
                ]
            ),
       
       .binaryTarget(
           name: "WeakDep1",
           path: "XCFrameworks/WeakDep1.xcframework"
       ),
       .binaryTarget(
           name: "WeakDep2",
           path: "XCFrameworks/WeakDep2.xcframework"
       ),
    ]
)
