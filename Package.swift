// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreLibrary",
    defaultLocalization: "en",
    platforms: [.iOS(.v12), .macOS(.v10_14)],
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreLibrary",
            targets: ["CoreLibrary"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", from: "5.0.1"),
        .package(url: "https://github.com/filom/ASN1Decoder", from: "1.7.1"),
        .package( name: "SwiftCBOR",
          url: "https://github.com/eu-digital-green-certificates/SwiftCBOR",
          .branch("master")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreLibrary",
            dependencies: ["SwiftCBOR", "SwiftyJSON", "ASN1Decoder"],
            path: "Sources",
            resources: [.process("Resources")]),
        .testTarget(
            name: "CoreLibraryTests",
            dependencies: ["CoreLibrary"]),
    ]
)
