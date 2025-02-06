// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "VitaleSDKReactNative",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "VitaleSDKReactNative",
            targets: ["VitaleSDKReactNative"]),
    ],
    dependencies: [
        .package(url: "https://github.com/miguelmunozfer/VitaleSPM", .branch("main"))
    ],
    targets: [
        .target(
            name: "VitaleSDKReactNative",
            dependencies: [
                .product(name: "VitaleHealthSDK", package: "VitaleSPM")
            ],
            path: "VitaleSDKBridge",
            sources: ["VitaleSDKBridge.swift"]
        )
    ]
) 