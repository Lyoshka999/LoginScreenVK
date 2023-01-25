//
//  Group.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import Foundation

// MARK: - GroupResponse
struct GroupResponse: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable, Identifiable {
    var id: Int
    var name: String
    var photo200: URL
}
