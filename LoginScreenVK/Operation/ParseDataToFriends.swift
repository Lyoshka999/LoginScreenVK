//
//  ParseDataToFriends.swift
//  LoginScreenVK
//
//  Created by Алексей on 15.01.2023.
//

import Foundation

class ParseDataToFriends: Operation {
    var friends: [Friend] = []
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data
        else { return }
        let friendsResponse = try? JSONDecoder().decode(Friends.self, from: data)
        guard let friends = friendsResponse?.response.items else { return }
        self.friends = friends
    }
}
