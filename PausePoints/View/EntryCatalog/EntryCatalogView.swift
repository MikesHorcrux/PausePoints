//
//  EntryCatalogView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 3/17/24.
//

import SwiftUI

struct EntryCatalogView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var entryType: EntryType
    @Binding var sheetNavigation: EntryNavigationViews
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Text("Please select your journal type.")
                    .font(.title2)
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding()
            ScrollView {
                ForEach(EntryType.allCases, id: \.self) { entry in
                    CatalogCard(entry: entry)
                        .onTapGesture {
                            entryType = entry
                            sheetNavigation = .entry
                        }
                }
                .frame(maxWidth: .infinity)
            }
           
           
        }
#if os(macOS)
        .frame(minWidth: 500)
#endif
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    NavigationStack {
        EntryCatalogView(entryType: .constant(.moment), sheetNavigation: .constant(.catalog))
    }
}
