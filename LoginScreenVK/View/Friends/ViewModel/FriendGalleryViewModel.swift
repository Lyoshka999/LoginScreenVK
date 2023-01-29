//
//  FriendGalleryViewModel.swift
//  LoginScreenVK
//
//  Created by Алексей on 29.01.2023.
//

import Foundation
import SwiftUI

class FriendGalleryViewModel: ObservableObject {
    private let apiService: APIService
    private let friend: Friend
    @Published var photos: [Photo] = []
    
    init(apiService: APIService, friend: Friend) {
        self.apiService = apiService
        self.friend = friend
    }
    
    func getPhotos() {
        if self.photos.isEmpty {
            self.apiService.getPhotos(ownerID: String(self.friend.id)) { photos in
                self.photos = photos
            }
        }
    }
}
