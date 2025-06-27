// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EudiWalletKit",
	platforms: [.macOS(.v13), .iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "EudiWalletKit",
            targets: ["EudiWalletKit"]),
    ],
    dependencies: [
		.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.3"),
        .package(
            name: "tw-lib-ios-iso18013-data-transfer",
            path: "../tw-lib-ios-iso18013-data-transfer"
        ),
        .package(
            name: "tw-lib-ios-wallet-storage",
            path: "../tw-lib-ios-wallet-storage"
        ),
		.package(url: "https://github.com/eu-digital-identity-wallet/eudi-lib-ios-siop-openid4vp-swift.git", exact: "0.1.1"),
        .package(
            name: "tw-lib-ios-openid4vci-swift",
            path: "../tw-lib-ios-openid4vci-swift"
        ),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "EudiWalletKit", dependencies: [
				.product(name: "MdocDataTransfer18013", package: "tw-lib-ios-iso18013-data-transfer"),
				.product(name: "WalletStorage", package: "tw-lib-ios-wallet-storage"),
				.product(name: "SiopOpenID4VP", package: "eudi-lib-ios-siop-openid4vp-swift"),
				.product(name: "OpenID4VCI", package: "tw-lib-ios-openid4vci-swift"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "EudiWalletKitTests",
            dependencies: ["EudiWalletKit"],
						resources: [.process("Resources")]
						)
    ]
)
