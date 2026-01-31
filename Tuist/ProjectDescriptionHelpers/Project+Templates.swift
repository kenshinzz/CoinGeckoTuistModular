import ProjectDescription

public enum BuildEnvironment: String, CaseIterable {
  case dev = "Dev"
  case staging = "Staging"
  case prod = "Prod"
  
  public var bundleIdSuffix: String {
    switch self {
    case .dev: return ".dev"
    case .staging: return ".staging"
    case .prod: return ""
    }
  }
  
  public var appName: String {
    switch self {
    case .dev: return "Crypto Dev"
    case .staging: return "Crypto Staging"
    case .prod: return "Crypto"
    }
  }
}

public extension Project {
  static func makeFrameworkTargets(
    name: String,
    bundleIdPrefix: String = "com.cryptoapp",
    dependencies: [TargetDependency] = [],
    resources: ResourceFileElements? = nil,
    hasTests: Bool = true
  ) -> [Target] {
    let frameworkTarget: Target = .target(
      name: name,
      destinations: .iOS,
      product: .framework,
      bundleId: "\(bundleIdPrefix).\(name.lowercased())",
      deploymentTargets: .iOS("18.0"),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: resources,
      dependencies: dependencies,
      settings: .settings(
        base: swiftConcurrencySettings,
        configurations: buildConfigurations
      )
    )
    
    var targets: [Target] = [frameworkTarget]
    
    if hasTests {
      let testTarget: Target = .target(
        name: "\(name)Tests",
        destinations: .iOS,
        product: .unitTests,
        bundleId: "\(bundleIdPrefix).\(name.lowercased()).tests",
        deploymentTargets: .iOS("18.0"),
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [.target(name: name)],
        settings: .settings(
          base: swiftConcurrencySettings,
          configurations: buildConfigurations
        )
      )
      targets.append(testTarget)
    }
    
    return targets
  }
}

// Swift 6 Concurrency Settings
public let swiftConcurrencySettings: SettingsDictionary = [
  "SWIFT_VERSION": "6.0",
  "SWIFT_STRICT_CONCURRENCY": "complete",
  "SWIFT_UPCOMING_FEATURE_CONCURRENCY_CHECKING": "YES",
  "SWIFT_UPCOMING_FEATURE_EXISTENTIAL_ANY": "YES",
  "SWIFT_UPCOMING_FEATURE_GLOBAL_CONCURRENCY": "YES",
  "SWIFT_DEFAULT_ACTOR_ISOLATION": "MainActor",
  "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
]

// Build Configurations
public let buildConfigurations: [Configuration] = [
  .debug(name: "Debug-Dev"),
  .debug(name: "Debug-Staging"),
  .release(name: "Release")
]

public func environmentSettings(for environment: BuildEnvironment, bundleId: String) -> SettingsDictionary {
  var settings = swiftConcurrencySettings
  settings["PRODUCT_BUNDLE_IDENTIFIER"] = .string(bundleId + environment.bundleIdSuffix)
  settings["PRODUCT_NAME"] = .string(environment.appName)
  settings["SWIFT_ACTIVE_COMPILATION_CONDITIONS"] = .string(environment.rawValue.uppercased())
  
  return settings
}


