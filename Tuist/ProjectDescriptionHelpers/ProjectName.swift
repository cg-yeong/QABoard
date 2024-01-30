//
//  ProjectName.swift
//  ProjectDescriptionHelpers
//
//  Created by cheonsong on 2022/09/02.
//

import ProjectDescription

public enum Module {
    case qaBoard
    // Repository|DataStore
    case data
    
    // Presentation
    case presentation
    
    // Domain
    case domain
    
    // Design|UI
    case designSystem
    
    case thirdpartyLib
}

extension Module {
    public var name: String {
        switch self {
        case .qaBoard:
            return "QABoard"
        case .data:
            return "Data"
        case .presentation:
            return "Presentation"
        case .domain:
            return "Domain"
        case .designSystem:
            return "DesignSystem"
        case .thirdpartyLib:
            return "ThirdpartyLib"
        }
    }
    
    public var path: ProjectDescription.Path {
        return .relativeToRoot("Projects/" + self.name)
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}

extension Module: CaseIterable { }
