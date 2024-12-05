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
        .package(url: "https://github.com/nbhasin2/llama.cpp.git", .revision("df334a11251b81fd0b6a0e51e7146e0ba9e973f2"))
    ],
    targets: [
        .target(name: "SwiftLlama", 
                dependencies: [
                    .product(name: "llama", package: "llama.cpp")
                ]),
        .testTarget(name: "SwiftLlamaTests", dependencies: ["SwiftLlama"]),
    ]
)
