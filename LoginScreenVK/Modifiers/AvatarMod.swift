//
//  AvatarMod.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct AvatarMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 50, maxHeight: 50)
            .clipShape(Circle())
            .shadow(color: .black, radius: 5, x: 3, y: 0)
            
    }
}

extension View {
    func avatarMod() -> some View {
        self.modifier(AvatarMod())
    }
}
