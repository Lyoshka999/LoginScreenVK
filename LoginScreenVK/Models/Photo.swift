//
//  Photo.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import Foundation

// MARK: - Photo
struct DataResponsePhoto: Codable {
    let response: ResponsePhoto
}

// MARK: - Response
struct ResponsePhoto: Codable {
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable, Identifiable {
    let id: Int
    let sizes: [SizePhoto]
    let ownerID: Int?
    let likes: Likes?
    private static let optimalSizes = ["x", "y", "z", "w"]
    
    
    func findURLPhotoIfNeeded(by sizeType: String) -> URL? {
        guard let sizeType: PhotoSizeType = PhotoSizeType.init(rawValue: sizeType) else { return nil }
        guard let sizePhoto = self.sizes.first(where: { $0.type == sizeType }) else { return nil }
        return sizePhoto.url
    }
    
    func findOptimalSize() -> URL? {
        for size in Self.optimalSizes {
            if let url = self.findURLPhotoIfNeeded(by: size) { return url }
        }
        return nil
    }
    
}

// MARK: - Likes
struct Likes: Codable {
    let userLikes, count: Int
}

// MARK: - Size
struct SizePhoto: Codable {
    let width, height: Int
    let url: URL?
    let type: PhotoSizeType
}

enum PhotoSizeType: String, Codable {
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}
//class Photo: Identifiable {
//    let id: UUID = UUID()
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
