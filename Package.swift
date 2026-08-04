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
            exact: "8.2.0-release.8"
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
                      url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPPangleAdapter-v8.2.800.zip",
                      checksum: "85c52c56334c937ea3b668f3933b71bb9dd09fe546e3a004fac9b236f938f7ff")
    ]
)
