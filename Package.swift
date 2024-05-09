// swift-tools-version: 5.10

import PackageDescription

let package = Package(
	name: "Template",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v5),
        .macCatalyst(.v13),
        .visionOS(.v1),
    ],
	products: [
		.library(name: "Template", targets: ["Template"]),
	],
	targets: [
		.target(
			name: "Template"
		),
		.testTarget(
			name: "TemplateTests",
			dependencies: ["Template"]
		),
	]
)

let swiftSettings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
]

for target in package.targets {
    var settings = target.swiftSettings ?? []
    settings.append(contentsOf: swiftSettings)
    target.swiftSettings = settings
}
