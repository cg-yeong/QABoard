import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.framework(
//     name: Module.designSystem.name,
//     dependencies: [],
//     resources: .default
// )

let project = Project.module(
    name: Module.designSystem.name,
    product: .framework,
    dependencies: [],
    resources: .default
)
