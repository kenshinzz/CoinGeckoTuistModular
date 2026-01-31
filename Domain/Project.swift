import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Domain",
  targets: Project.makeFrameworkTargets(
    name: "Domain",
    dependencies: [
      .project(target: "Core", path: "../Core")
    ]
  )
)
