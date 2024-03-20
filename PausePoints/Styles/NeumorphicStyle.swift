//
//  NeumorphicStyle.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 3/18/24.
//

import Foundation
import SwiftUI


struct NeumorphicStyleModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .background(Color("BackgroundColor"))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            // Apply neumorphic shadows
            .shadow(color: .nephoLightShadow.opacity(colorScheme == .dark ? 0.4 : 1), radius: 8, x: -8, y: -8)
            .shadow(color: .nephoDarkShadow.opacity(0.5), radius: 8, x: 8, y: 8)
    }
}

// Extension to apply the modifier more easily
extension View {
    func neumorphicStyle() -> some View {
        self.modifier(NeumorphicStyleModifier())
    }
}
