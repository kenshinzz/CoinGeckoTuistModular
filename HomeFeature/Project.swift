import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "HomeFeature",
  targets: Project.makeFrameworkTargets(
    name: "HomeFeature",
    dependencies: [
      .project(target: "Core", path: "../Core"),
      .project(target: "DesignSystem", path: "../DesignSystem"),
      .project(target: "Domain", path: "../Domain"),
      .project(target: "Coordinator", path: "../Coordinator")
    ]
  )
)
