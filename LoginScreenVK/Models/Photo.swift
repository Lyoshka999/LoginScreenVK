//
//  Photo.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import Foundation

class Photo: Identifiable {
    let id: UUID = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
