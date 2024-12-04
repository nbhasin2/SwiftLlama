// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "SwiftLlama",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .watchOS(.v4),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "SwiftLlama", targets: ["SwiftLlama"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp.git", branch: "master")
    ],
    targets: [
        .target(name: "SwiftLlama", 
                dependencies: [
                    .product(name: "llama", package: "llama.cpp")
                ]),
        .testTarget(name: "SwiftLlamaTests", dependencies: ["SwiftLlama"]),
    ]
)
