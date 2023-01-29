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
    let apiService = APIService()
    
    var body: some View {
        List(self.viewModel.friends) { myFriend in
            let friendGalleryViewModel = FriendGalleryViewModel(apiService: apiService, friend: myFriend)
            NavigationLink(
                destination: FriendGalleryView(viewModel: friendGalleryViewModel),
                label: {
                    FriendCellView(friend: myFriend)
                })
        }.onAppear{
            viewModel.getFriends()
        }
    }
}

