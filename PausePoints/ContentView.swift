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

    @State var showSheet = false
    @State var entryType: EntryType = .moment
    @State var sheetNavigation: EntryNavigationViews = .catalog
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(entries) { entry in
                    NavigationLink {
                        EntryView(entry: entry)
                    } label: {
                        VStack(alignment: .leading){
                            Text(entry.creationDate.formatted(date: .long, time: .shortened))
                            HStack {
                                Image(systemName: entry.entryType.iconName)
                                Text(entry.entryType.rawValue)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .background(Color("BackgroundColor"))
            .scrollContentBackground(.hidden)
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
                            sheetNavigation = .catalog
                            showSheet.toggle()
                        }) {
                            Label("Add new entry", systemImage: "book.pages")
                        }
                        .frame(width: 35, height: 35)
                        .buttonStyle(.borderedProminent)
                        .clipShape(Circle())
                       
                    }
            }
        } detail: {
            Text("Select an item")
        }
       
        .sheet(isPresented: $showSheet, content: {
            switch sheetNavigation {
            case .catalog:
                EntryCatalogView(entryType: $entryType, sheetNavigation: $sheetNavigation)
            case .entry:
                NewEntryView(entryType: entryType)
            }
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
