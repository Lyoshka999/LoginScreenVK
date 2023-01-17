//
//  FriendCellView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI
import Kingfisher

struct FriendCellView: View {
    let friend: Friend
    
    var body: some View {
        HStack {
            let url = URL(string: self.friend.photo200_Orig!)
            KFImage(url)
                .cancelOnDisappear(true)
                .resizable()
                .avatarMod()
            
            VStack(alignment: .leading) {
                Text("\(self.friend.firstName) \(self.friend.lastName)")
                    .font(.body)
            
                Text("\(self.friend.status.rawValue)")
                    .font(.subheadline)
                    .statusColorMod(status: self.friend.status)
            }
            
            Spacer()
        }
        .padding(.init(top: 6,
                       leading: 0,
                       bottom: 6,
                       trailing: 0))
    }
}

//struct FriendCellView: View {
//    let friend: Friend
//
//    var body: some View {
//        HStack {
//            Image(self.friend.photo)
//                .resizable()
//                .avatarMod()
//
//            VStack(alignment: .leading) {
//                Text("\(self.friend.firstName) \(self.friend.lastName)")
//                    .font(.body)
//
//                Text("\(self.friend.status.rawValue)")
//                    .font(.subheadline)
//                    .statusColorMod(status: self.friend.status)
//            }
//
//            Spacer()
//        }
//        .padding(.init(top: 6,
//                       leading: 0,
//                       bottom: 6,
//                       trailing: 0))
//    }
//}
//
//struct FriendCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        let friend = Friend(id: 0, firstName: "Паук", lastName: "Человек", photo: "spider-man", status: .onLine)
//        FriendCellView(friend: friend)
//    }
//}
