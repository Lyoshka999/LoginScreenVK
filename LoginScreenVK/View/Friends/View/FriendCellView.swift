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
            KFImage(self.friend.photo200Orig)
                .cancelOnDisappear(true)
                .resizable()
                .avatarMod()
                .avatarAnimationModifier()
            
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
