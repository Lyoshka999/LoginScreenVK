//
//  GroupsListView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct GroupsListView: View {
    
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        List(self.viewModel.groups) { group in
            GroupCellView(group: group)
        }
        .onAppear{
            viewModel.getGroups()
        }
    }
}

