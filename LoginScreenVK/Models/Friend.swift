//
//  Friend.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import Foundation

// MARK: - Friends
struct S: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
class Friend: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var photo200_Orig: String?
    var online: Int

    var status: Status {
        get {
            return online == 1 ? Status.onLine : Status.offLine
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, online
        case photo200_Orig = "photo_200_orig"
        case lastName = "last_name"
        case firstName = "first_name"
    }
}
//class Friend: Identifiable {
//    var id: Int
//    let firstName: String
//    let lastName: String
//    var status: Status
//    let photo: String
//    let photos: [Photo]
//
//    init(id: Int, firstName: String, lastName: String, photo: String = "", status: Status = .offLine, photos: [Photo] = []) {
//        self.id = id
//        self.firstName = firstName
//        self.lastName = lastName
//        self.status = status
//        self.photo = photo
//        self.photos = photos
//    }
//}
