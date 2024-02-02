//
//  ContentView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 1/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var entries: [Entry]

    @State var showNewEntry = false
    @State var entryType: EntryType = .moment
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(entries) { entry in
                    NavigationLink {
                        EntryView(entry: entry)
                    } label: {
                        VStack(alignment: .leading){
                            Text(Date.now.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: {
                        entryType = .moment
                        showNewEntry.toggle()
                    }) {
                        Label("Add moment", systemImage: "tree")
                    }
                    .frame(width: 35, height: 35)
                    .buttonStyle(.borderedProminent)
                    .clipShape(Circle())
                   
                }
                ToolbarItem {
                    Button(action: {
                        entryType = .reflectionPoint
                        showNewEntry.toggle()
                    }) {
                        Label("Add reflection", systemImage: "leaf")
                    }
                    .frame(width: 33, height: 33)
                    .buttonStyle(.borderedProminent)
                    .clipShape(Circle())
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $showNewEntry, content: {
            NewEntryView(entryType: entryType)
        })
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(entries[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Entry.self, inMemory: true)
}
