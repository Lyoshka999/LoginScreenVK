//
//  FriendViewModel.swift
//  LoginScreenVK
//
//  Created by Алексей on 15.01.2023.
//

import Foundation
import Combine

class FriendViewModel: ObservableObject {
    
    let apiService: APIService
    @Published var friends: [Friend] = []
    
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getFriends() {
        apiService.getFriends { friends in
            DispatchQueue.main.async {
                self.friends = friends
            }
        }
    }
}
