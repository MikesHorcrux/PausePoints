//
//  NeumorphicButtonStyle.swift
//  PausePoints
//
//  Created by Mike  Van Amburg on 3/18/24.
//

import Foundation
import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("BackgroundColor"))
            .foregroundColor(Color.primary.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            // Adjust the shadow based on the button's press state
            .shadow(color: configuration.isPressed ? .nephoDarkShadow.opacity(0.5) : .nephoLightShadow.opacity(1), radius: 8, x: configuration.isPressed ? 4 : -8, y: configuration.isPressed ? 4 : -8)
            .shadow(color: configuration.isPressed ? .nephoLightShadow.opacity(1) : .nephoDarkShadow.opacity(0.5), radius: 8, x: configuration.isPressed ? -4 : 8, y: configuration.isPressed ? -4 : 8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
