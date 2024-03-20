//
//  CatalogCard.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 3/17/24.
//

import SwiftUI

struct CatalogCard: View {
    let entry: EntryType
    var body: some View {
        VStack {
            Image(systemName: entry.iconName)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.accentColor.opacity(0.9)) // Soft icon color
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .neumorphicStyle()
                .padding(10)
            Text(entry.rawValue)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.primary.opacity(0.8)) // Soft text color
            Text(entry.description)
                .font(.subheadline)
                .foregroundColor(Color.primary.opacity(0.8)) // Soft text color
        }
        .padding()
        .frame(width: 350, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .neumorphicStyle()
        .padding(.vertical)
    }
}

#Preview {
    CatalogCard(entry: EntryType.jotDown)
        .padding(30)
        .background(Color("BackgroundColor"))
}
