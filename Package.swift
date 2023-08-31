// swift-tools-version: 5.8

import PackageDescription

let settings: [SwiftSetting] = [
	.enableExperimentalFeature("StrictConcurrency")
]

let package = Package(
	name: "Template",
	products: [
		.library(name: "Template", targets: ["Template"]),
	],
	targets: [
		.target(
			name: "Template",
			swiftSettings: settings
		),
		.testTarget(
			name: "TemplateTests",
			dependencies: ["Template"],
			swiftSettings: settings
		),
	]
)
