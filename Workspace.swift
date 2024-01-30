import ProjectDescription
import ProjectDescriptionHelpers

//let workspace = Workspace(name: "QABoard",
//                          projects: Module.allCases.map(\.path))
let workspace = Workspace(
    name: QABoardEnv.appName,
    projects: [
        "Projects/\(QABoardEnv.appName)"
    ]
)
