import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: Module.data.name,
    product: .framework,
    dependencies: [Module.domain.project] + [.moya, .swiftyJson, .realm, .realmSwift]
)
