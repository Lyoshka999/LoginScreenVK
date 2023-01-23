//
//  FriendsListView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI
import Combine

struct FriendsListView: View {
    
    @ObservedObject var viewModel: FriendViewModel
    
    var body: some View {
        List(self.viewModel.friends) { myFriend in
            NavigationLink(
                destination: FriendGalleryView(friend: myFriend),
                label: {
                    FriendCellView(friend: myFriend)
                })
        }.onAppear{
            viewModel.getFriends()
        }
        
    }
}

