// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "VitaleHealthSDK",
    products: [
        .library(
            name: "VitaleHealthSDK",
            targets: ["VitaleHealthLibrary"]),
    ],
    dependencies: [
        .package(name: "TrainingSDKSPM", url: "https://github.com/miguelmunozfer/WorkoutSPM", .branch("main")),
        .package(name: "NutritionSDKPlugin", url: "https://github.com/miguelmunozfer/NutritionSDKPlugin", .branch("main"))
    ],
    targets: [
        .binaryTarget(
            name: "VitaleHealthBinary",
            path: "./VitaleHealthSDK.xcframework"),
        .target(
            name: "VitaleHealthLibrary",
            dependencies: [
                "VitaleHealthBinary",
                .product(name: "TrainingSDK", package: "TrainingSDKSPM"),
                .product(name: "NutritionIASDK", package: "NutritionSDKPlugin")
            ],
            path: "Sources/VitaleHealthLibrary"
        )
    ]
)
