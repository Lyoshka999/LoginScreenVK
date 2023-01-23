//
//  StatusColorMod.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct StatusColorMod: ViewModifier {
    let status: Status
    
    func body(content: Content) -> some View {
        var color: Color
        
        if status == .onLine {
            color = Color.green
        } else {
            color = Color.red
        }
        return content.foregroundColor(color)
    }
}

extension View {
    func statusColorMod(status: Status) -> some View {
        self.modifier(StatusColorMod(status: status))
    }
}
