import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: "QABoard",
    dependencies: [
        Module.domain,
        Module.data,
        Module.presentation,
        Module.designSystem
    ].map(\.project),
    resources: .default
)
