//
//  Entry.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/26/24.
//

import Foundation
import SwiftData

@Model
class Entry {
    var creationDate: Date
    var entryType: EntryType
    var responses: [String: String]

    init(creationDate: Date, entryType: EntryType) {
        self.creationDate = creationDate
        self.entryType = entryType
        self.responses = [:]

        // Initialize with empty strings for each question
        switch entryType {
        case .moment:
            MomentQuestions.allCases.forEach { self.responses[$0.rawValue] = "" }
        case .reflectionPoint:
            ReflectionPointQuestions.allCases.forEach { self.responses[$0.rawValue] = "" }
        }
    }

    var relevantQuestions: [String] {
        switch entryType {
        case .moment:
            return MomentQuestions.allCases.map { $0.rawValue }
        case .reflectionPoint:
            return ReflectionPointQuestions.allCases.map { $0.rawValue }
        }
    }
}
