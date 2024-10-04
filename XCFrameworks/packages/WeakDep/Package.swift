// swift-tools-version: 6.0

import PackageDescription
import Foundation

func prebuiltTarget(name: String, dependencies: [Target.Dependency] = []) -> [Target] {
    return [
        .binaryTarget(
            name: name,
            path: "../../\(name).xcframework"
        ),
        .target(
            name: "\(name)_Aggregation",
            dependencies: [
                .target(name: name),
            ] + dependencies
        ),
    ]
}

let targets: [[Target]] = [
    prebuiltTarget(
        name: "WeakDep2",
        dependencies: [
            "WeakDep1_Aggregation",
        ]
    ),
    prebuiltTarget(name: "WeakDep1"),
]

let package = Package(
    name: "WeakDep",
    // platforms: [],
    products: [
        .library(
            name: "WeakDep",
            targets: [
                "WeakDep2_Aggregation",
            ]),
    ],
    dependencies: [

    ],
    targets: targets.flatMap { $0 }
)