//
//  GroupCellView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        HStack {
            Image(self.group.photo)
                .resizable()
                .avatarMod()
            
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

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        let group = Group(id: 0, name: "Группа для бубликов", photo: "бублики")
        GroupCellView(group: group)
    }
}
