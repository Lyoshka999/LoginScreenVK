//
//  GroupsListView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct GroupsListView: View {
    @State var groups: [Group] = []
    
    var body: some View {
        
        List(self.groups) { group in
            GroupCellView(group: group)
        }.onAppear{
            self.groups = self.fillGroups()
        }
    }
    
    private func fillGroups() -> [Group] {
        var groupsLockal: [Group] = []
        for i in 0...100 {
            let group = Group(id: i, name: "\(i) Группа для бубликов", photo: "бублики")
            groupsLockal.append(group)
        }
        return groupsLockal
    }
}

struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView()
    }
}
