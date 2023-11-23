// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ParentPackage",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "ParentPackage",
            type: .static,
            targets: ["ParentPackage"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/emqx/CocoaMQTT.git", from: "2.1.8"),
        .package(url: "https://github.com/auth0/JWTDecode.swift.git", from: "3.1.0")
    ],
    targets: [
        .target(
            name: "ParentPackage",
            dependencies: [
                "CocoaMQTT",
                .product(name: "JWTDecode", package: "JWTDecode.swift")
            ]),
        .testTarget(
            name: "ParentPackageTests",
            dependencies: ["ParentPackage"]),
    ]
)
