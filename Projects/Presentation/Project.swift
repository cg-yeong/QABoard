import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.framework(
//     name: Module.presentation.name,
//     dependencies: [Module.domain.project] + [.snapKit, .then],
//     resources: .default
// )

let project = Project.module(
    name: Module.presentation.name,
    product: .framework,
    dependencies: [
        Module.domain.project,
        Module.designSystem.project,
        Module.data.project
    ] + [.snapKit, .then],
    resources: .default
)
