//
//  QuestionView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/26/24.
//

import SwiftUI

struct QuestionView: View {
    @Binding var entry: Entry
    let question: String
    let onContinue: () -> Void

    @State private var response: String = ""  // State variable to hold the response

    var body: some View {
        VStack {
            Text(question)
                .font(.headline)
                .padding()

            TextField("Your answer...", text: $response)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Continue", action: {
                entry.updateResponse(for: question, with: response)
                response = ""
                onContinue()
            })
            .padding()
        }
    }
}

#Preview {
    QuestionView(entry: .constant(Entry(creationDate: Date(), entryType: .moment)), question: "This is the question that will be asked.", onContinue: {})
}
