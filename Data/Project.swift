import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Data",
  targets: Project.makeFrameworkTargets(
    name: "Data",
    dependencies: [
      .project(target: "Core", path: "../Core"),
      .project(target: "Domain", path: "../Domain"),
      .project(target: "NetworkKit", path: "../NetworkKit"),
    ]
  )
)
