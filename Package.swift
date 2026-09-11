// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-Pangle-iOS-Adapter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPPangleAdapter",
            targets: ["VAMPPangleAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
        .package(
            url: "https://github.com/bytedance/AdsGlobalPackage",
            exact: "8.2.1-release.1"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPPangleAdapterTarget",
            dependencies: [
                .target(name: "VAMPPangleAdapter"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage")
            ],
            path: "VAMPPangleAdapterTarget"
        ),
        .binaryTarget(name: "VAMPPangleAdapter",
                      url: "https://github.com/AdGeneration/VAMP-Pangle-iOS-Adapter/releases/download/8.2.10100/VAMPPangleAdapter-v8.2.10100.zip",
                      checksum: "b7e41dafeba17c56d7c8d191aed26b83dd42167c3f9aad1127930bedfded0740")
    ]
)
