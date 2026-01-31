import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "CryptoApp",
  targets: [
    .target(
      name: "CryptoApp",
      destinations: .iOS,
      product: .app,
      bundleId: "com.cryptoapp",
      deploymentTargets: .iOS("18.0"),
      infoPlist: .extendingDefault(
        with: [
          "UILaunchScreen": [:],
          "CFBundleShortVersionString": "1.0",
          "CFBundleVersion": "1"
        ]
      ),
      sources: ["Sources/**"],
      dependencies: [
        .project(target: "Core", path: "../Core"),
        .project(target: "Domain", path: "../Domain"),
        .project(target: "Data", path: "../Data"),
        .project(target: "Coordinator", path: "../Coordinator"),
        .project(target: "HomeFeature", path: "../HomeFeature"),
        .project(target: "MyCoinFeature", path: "../MyCoinFeature"),
      ],
      settings: .settings(
        base: swiftConcurrencySettings,
        configurations: []
      )
    ),
    .target(
      name: "CryptoAppTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "com.cryptoapp.tests",
      deploymentTargets: .iOS("16.0"),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [
        .target(name: "CryptoApp")
      ],
      settings: .settings(
        base: swiftConcurrencySettings,
        configurations: []
      )
    )
  ]
)

