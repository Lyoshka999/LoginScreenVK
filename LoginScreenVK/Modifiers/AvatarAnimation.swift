//
//  AvatarAnimation.swift
//  LoginScreenVK
//
//  Created by Алексей on 23.01.2023.
//

import Foundation
import SwiftUI

struct AvatarAnimation: ViewModifier {
    
    @State var scale: CGFloat = 1
    
    func body(content: Content) -> some View {
        content
            .animation(Animation.interpolatingSpring(mass: 2,
                                                     stiffness: 50,
                                                     damping: 6,
                                                     initialVelocity: 0.5), value: scale)
            
            .onTapGesture {
                withAnimation(.linear(duration: 0.3)) {
                    self.scale = 0.7

                    var dispatchTime = DispatchTime.now() + 0.7
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.scale = 1.2
                    }

                    dispatchTime = dispatchTime + 0.7
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.scale = 1
                    }
                }
            }
    }
}

extension View {
    func avatarAnimationModifier() -> some View {
        self.modifier(AvatarAnimation())
    }
}
