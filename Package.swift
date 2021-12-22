// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIFirebaseAuth",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftUIFirebaseAuth",
            targets: ["SwiftUIFirebaseAuth"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftUIFirebaseAuth",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
                .product(name: "FirebaseAuthCombine-Community", package: "Firebase")
            ]),
        .testTarget(
            name: "SwiftUIFirebaseAuthTests",
            dependencies: ["SwiftUIFirebaseAuth"]),
    ]
)
