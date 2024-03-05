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
    
    private var responseBinding: Binding<String> {
        Binding<String>(
            get: { self.entry.responses[question] ?? "" },
            set: { self.entry.responses[question] = $0 }
        )
    }
    
    var body: some View {
        VStack {
            Text(question)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding()
            
            TextField("Your answer...", text: responseBinding, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .padding()
        }
        .toolbar {
            #if os(iOS)
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Continue") {
                    onContinue()
                }
            }
            #endif
        }
    }
}



#Preview {
    NavigationStack {
        QuestionView(entry: .constant(Entry(creationDate: Date(), entryType: .moment)), question: "This is the question that will be asked.", onContinue: {})
    }
}
