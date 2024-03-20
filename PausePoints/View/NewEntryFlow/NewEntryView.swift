//
//  NewEntryView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/26/24.
//

import SwiftUI
import SwiftData

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
                    Spacer()
                    HStack {
                        Button(
                            action: {
                                if currentQuestionIndex > 0 {
                                    currentQuestionIndex -= 1
                                }
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .fontWeight(.heavy)
                            }
                        )
                        .disabled(currentQuestionIndex == 0)
                        .buttonStyle(NeumorphicButtonStyle())
                        Spacer()
                        
                        Button(action: {
                            if currentQuestionIndex < entry.relevantQuestions.count - 1 {
                                currentQuestionIndex += 1
                            } else {
                                showSummary = true
                            }
                        }, label: {
                            Image(systemName: "chevron.right")
                                .fontWeight(.heavy)
                        })
                        .buttonStyle(NeumorphicButtonStyle())
                    }
                    
                    .ignoresSafeArea(.keyboard)
                    .padding()
                }
                .background(Color("BackgroundColor").ignoresSafeArea(.all))
                .toolbar() {
                    #if os(iOS)
                    ToolbarItem(placement: .topBarLeading) {
                        Text(entry.entryType.rawValue)
                            .foregroundStyle(.accent)
                    }
                    #else
                    ToolbarItem(placement: .secondaryAction) {
                        Text(entry.entryType.rawValue)
                            .foregroundStyle(.accent)
                    }
                    #endif
                }
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
