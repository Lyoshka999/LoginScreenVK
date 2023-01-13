//
//  FriendsListView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct FriendsListView: View {
    @State var friends: [Friend] = []
    
    var body: some View {
        List(self.friends) { friend in
            NavigationLink(
                destination: FriendGalleryView(friend: friend),
                label: {
                    FriendCellView(friend: friend)
                })
        }.onAppear{
            self.friends = self.fillFriends()
        }
    }
    
    private func fillFriends() -> [Friend] {
        var friendsLockal: [Friend] = []
        for i in 0...100 {
            var photos: [Photo] = []
            for y in 0...50 {
                photos.append(Photo(name: "\(y)"))
            }
            let friend = Friend(id: i, firstName: "Паук (\(i))", lastName: "Человек", photo: "spider-man", status: .offLine, photos: photos)
            friendsLockal.append(friend)
        }
        return friendsLockal
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
