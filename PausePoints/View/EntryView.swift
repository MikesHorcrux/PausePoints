//
//  EntryView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/27/24.
//

import SwiftUI

struct EntryView: View {
    var entry: Entry
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
            .scrollContentBackground(.hidden)
        }
        .background(Color("BackgroundColor"))
        .navigationTitle(entry.creationDate.formatted())
    }
}

#Preview {
    EntryView(entry: Entry(creationDate: Date(), entryType: .moment))
}
