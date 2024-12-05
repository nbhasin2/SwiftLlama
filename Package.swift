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
        .package(url: "https://github.com/nbhasin2/llama.cpp.git", .revision("e991e3127ff71a29e61fe1de5dd1cbd2e1df1858"))
    ],
    targets: [
        .target(name: "SwiftLlama", 
                dependencies: [
                    .product(name: "llama", package: "llama.cpp")
                ]),
        .testTarget(name: "SwiftLlamaTests", dependencies: ["SwiftLlama"]),
    ]
)
