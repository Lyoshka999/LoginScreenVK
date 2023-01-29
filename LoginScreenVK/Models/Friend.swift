//
//  Friend.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import Foundation

// MARK: - Friends
struct Friends: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
struct Friend: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var photo200Orig: URL
    var online: Int
    
    var status: Status {
        return online == 1 ? Status.onLine : Status.offLine
    }
}
