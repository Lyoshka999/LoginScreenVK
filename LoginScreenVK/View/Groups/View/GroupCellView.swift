//
//  GroupCellView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI
import Kingfisher

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        HStack {
            KFImage(self.group.photo200)
                .cancelOnDisappear(true)
                .resizable()
                .avatarMod()
                .avatarAnimationModifier()
            
            Text("\(self.group.name)")
                .font(.body)
            
            Spacer()
        }
        .padding(.init(top: 6,
                       leading: 0,
                       bottom: 6,
                       trailing: 0))
    }
}
