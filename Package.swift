// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "kiwi",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "kiwi",
            targets: ["kiwi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
        .package(url: "https://github.com/STREGAsGate/Raylib.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "kiwi",
            dependencies: []
        ),
        
        // Benches //
        .executableTarget(
            name: "performance-benches",
            dependencies: [
                .product(name: "Benchmark", package: "swift-benchmark"),
                "kiwi"
            ],
            path: "Sources/benches/performance-benches"
        ),
        .executableTarget(
            name: "uot-bench",
            dependencies: ["kiwi"],
            path: "Sources/benches/uot-bench"
        ),
        .executableTarget(
            name: "uot-bench-big",
            dependencies: ["kiwi"],
            path: "Sources/benches/uot-bench-big"
        ),
        
        // Demos //
        .executableTarget(
            name: "pong-demo",
            dependencies: ["kiwi", "Raylib"],
            path: "Sources/demos/pong"
        ),
        
        // Tests //
        .testTarget(
            name: "kiwiTests",
            dependencies: ["kiwi"]
        ),
    ]
)
