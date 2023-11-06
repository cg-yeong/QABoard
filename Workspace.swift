import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "QABoard",
                          projects: Module.allCases.map(\.path))
