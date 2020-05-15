// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftCryptoTokenFormatter",
    platforms: [
        .macOS(.v10_14), .iOS(.v11),
    ],
    products: [
        .library(
            name: "SwiftCryptoTokenFormatter",
            targets: ["SwiftCryptoTokenFormatter"])
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", .upToNextMinor(from: "5.1.0"))
    ],
    targets: [
        .target(
            name: "SwiftCryptoTokenFormatter", 
            dependencies: ["BigInt"],
            path: "Sources"),
        .testTarget(name: "SwiftCryptoTokenFormatterTests", dependencies: ["SwiftCryptoTokenFormatter"], path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
