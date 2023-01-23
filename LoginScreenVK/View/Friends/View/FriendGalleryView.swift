//
//  FriendGalleryView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI
import ASCollectionView

struct FriendGalleryView: View {
    
    let friend: Friend
    
    var body: some View {
        Text("Здесь будет галлерея друзей")
//        ASCollectionView(data: self.friend.photos) { photo, context in
//            Text("\(photo.name)")
//                .background(Color.green)
//        }
//        .layout {
//            .grid(
//                layoutMode: .adaptive(withMinItemSize: 50),
//                itemSpacing: 5,
//                lineSpacing: 5,
//                itemSize: .absolute(50))
//        }
    }
}

//struct FriendGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendGalleryView(friend: Friend(id: 0, firstName: "Lyoshka", lastName: "Sidorenko"))
//    }
//}
