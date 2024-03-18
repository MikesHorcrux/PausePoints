//
//  EntryCatalogView.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 3/17/24.
//

import SwiftUI

struct EntryCatalogView: View {
    @Binding var entryType: EntryType
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Text("Please select your journal type.")
                    .font(.headline)
                Spacer()
            }
            ScrollView {
                ForEach(EntryType.allCases, id: \.self) { entry in
                    VStack {
                        Image(systemName: entry.iconName)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                            .frame(width: 50, height: 50)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(10)
                        Text(entry.rawValue)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text(entry.description)
                            .font(.subheadline)
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 350, height: 200)
                    .background(.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(.vertical)
                    .onTapGesture {
                        entryType = entry
                    }
                }
            }
            .frame(width: .infinity)
        }
        .padding()
        #if os(macOS)
        .frame(minWidth: 500)
        #endif
    }
}

#Preview {
    NavigationStack {
        EntryCatalogView(entryType: .constant(.moment))
    }
}
