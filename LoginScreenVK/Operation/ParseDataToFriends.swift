//
//  ParseDataToFriends.swift
//  LoginScreenVK
//
//  Created by Алексей on 15.01.2023.
//

import Foundation

class ParseDataToFriends: Operation {
    var myFriends: [Friend] = []
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data
        else { return }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let friendsResponse = try? jsonDecoder.decode(Friends.self, from: data)
        guard let myFriends = friendsResponse?.response.items else { return }
        self.myFriends = myFriends
    }
}
