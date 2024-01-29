//
//  NewEntryView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/26/24.
//

import SwiftUI

struct NewEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var currentQuestionIndex = 0
    @State private var entry: Entry
    @State private var showSummary = false

    init(entryType: EntryType) {
        _entry = State(initialValue: Entry(creationDate: Date(), entryType: entryType))
    }

    var body: some View {
        NavigationStack {
            if showSummary {
                NewEntrySummaryView(entry: $entry) {
                    // Save action
                    saveEntry()
                    dismiss()
                }
            } else {
                VStack {
                    let question = entry.relevantQuestions[currentQuestionIndex]
                    QuestionView(entry: $entry, question: question) {
                        if currentQuestionIndex < entry.relevantQuestions.count - 1 {
                            currentQuestionIndex += 1
                        } else {
                            showSummary = true
                        }
                    }

                    HStack {
                        Button("Back", action: {
                            if currentQuestionIndex > 0 {
                                currentQuestionIndex -= 1
                            }
                        }).disabled(currentQuestionIndex == 0)

                        Spacer()

                        Button("Next", action: {
                            if currentQuestionIndex < entry.relevantQuestions.count - 1 {
                                currentQuestionIndex += 1
                            } else {
                                showSummary = true
                            }
                        })
                    }.padding()
                }
                .navigationTitle("New Entry")
            }
        }
    }

    private func saveEntry() {
        modelContext.insert(entry)
    }
}


#Preview {
    NewEntryView(entryType: .reflectionPoint)
}
