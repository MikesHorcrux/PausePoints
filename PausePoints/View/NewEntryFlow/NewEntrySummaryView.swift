//
//  NewEntrySummaryView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/27/24.
//

import SwiftUI

struct NewEntrySummaryView: View {

    @Binding var entry: Entry
       let onSave: () -> Void

       var body: some View {
           VStack {
               List {
                   ForEach(entry.relevantQuestions, id: \.self) { question in
                       VStack(alignment: .leading) {
                           Text(question).bold()
                           Text(entry.responses[question, default: "No response"])
                       }
                   }
               }
               Button("Save Entry", action: onSave)
                   .padding()
           }
           .navigationTitle("Summary")
       }
}

#Preview {
    NewEntrySummaryView(entry: .constant(Entry.init(creationDate: Date(), entryType: .moment)), onSave: {})
}
