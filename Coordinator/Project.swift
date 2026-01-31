import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Coordinator",
  targets: Project.makeFrameworkTargets(
    name: "Coordinator",
    dependencies: [
      .project(target: "Core", path: "../Core")
    ]
  )
)
