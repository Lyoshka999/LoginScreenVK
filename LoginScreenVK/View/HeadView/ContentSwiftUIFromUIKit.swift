//
//  ContentSwiftUIFromUIKit.swift
//  LoginScreenVK
//
//  Created by Алексей on 25.01.2023.
//

import Foundation
import SwiftUI

struct ContentSwiftUIFromUIKit: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> HeadCoordinator {
        HeadCoordinator()
    }
    
    func updateUIViewController(_ uiViewController: HeadCoordinator, context: Context) { }
}
