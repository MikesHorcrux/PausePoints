//
//  EntryType.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/26/24.
//

import Foundation

enum EntryType: String, Codable, CaseIterable {
    
    case jotDown = "Jot Down"
    case moment = "Moment"
    case reflectionPoint = "Reflection Point"
    
    /// Provides an icon name associated with the entry type.
    /// - Returns: A string representing the icon name. "leaf" for moments, "tree" for reflection points.
    var iconName: String {
            switch self {
            case .moment:
                return "leaf"
            case .reflectionPoint:
                return "tree"
            case .jotDown:
                return "pencil"
            }
        }

    /// Provides a description of the entry type.
    /// - Returns: A string with a detailed description of what the entry type signifies.
    var description: String {
            switch self {
            case .moment:
                return "Significant time, memorable for its impact or uniqueness."
            case .reflectionPoint:
                return "Time for self-reflection, understanding personal growth or insights."
            case .jotDown:
                return "Quick notes or thoughts, freely expressed without structure."
            }
        }
}
