import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "DesignSystem",
  targets: Project.makeFrameworkTargets(
    name: "DesignSystem",
    dependencies: [
      .project(target: "Core", path: "../Core")
    ]
  )
)
