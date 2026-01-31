import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Core",
  targets: Project.makeFrameworkTargets(
    name: "Core",
    dependencies: []
  )
)
