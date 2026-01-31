import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "NetworkKit",
  targets: Project.makeFrameworkTargets(
    name: "NetworkKit",
    dependencies: [
      .project(target: "Core", path: "../Core")
    ]
  )
)
