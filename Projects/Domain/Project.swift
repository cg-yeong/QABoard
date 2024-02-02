import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.framework(
//     name: Module.domain.name,
//     dependencies: [
// 
//     ]
// )

let project = Project.module(
    name: Module.domain.name,
    product: .staticFramework,
    dependencies: []
)
