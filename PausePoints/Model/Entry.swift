//
//  Entry.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/26/24.
//

import Foundation
import SwiftData


/// `Entry` represents a journal entry in the app. It can be either a specific moment or a more general reflection point.
/// This class encapsulates the commonalities of both types of entries.
@Model
class Entry {
    var creationDate: Date
    var entryType: EntryType
    
    // A dictionary to store responses to predefined questions based on the entry type.
    // The key is the question, and the value is the user's response.
    var responses: [String: String]

    
    /// Initializes a new entry with specified details.
    /// - Parameters:
    ///   - creationDate: The date and time when the entry is created.
    ///   - entryType: The type of the entry (moment or reflection point).
    ///   - content: The main content or description of the entry.
    init(creationDate: Date, entryType: EntryType) {
        self.creationDate = creationDate
        self.entryType = entryType
        self.responses = [:]

        // Initialize responses with empty strings for each question based on the entry type.
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
    
    /// Updates the response for a specific question in the entry.
    /// - Parameters:
    ///   - question: The question for which the response is being updated.
    ///   - response: The user's response to the question.
    func updateResponse(for question: String, with response: String) {
        responses[question] = response
    }
}

