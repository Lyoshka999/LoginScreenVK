//
//  HeadView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

enum Tabs: String {
    case friends = "Друзья"
    case groups = "Группы"
    case news = "Новости"
}

struct HeadView: View {
    
    @State var selectedTab: Tabs = .friends
    let apiService = APIService()
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            let friendViewModel = FriendViewModel(apiService: apiService)
            FriendsListView(viewModel: friendViewModel)
                .tabItem { Label("Друзья", systemImage: "person.2.fill") }
                .tag(Tabs.friends)
            
            let groupViewModel = GroupViewModel(apiService: apiService)
            GroupsListView(viewModel: groupViewModel)
                .tabItem { Label("Группы", systemImage: "person.3.fill") }
                .tag(Tabs.groups)
            
            NewsListView()
                .tabItem { Label("Новости", systemImage: "newspaper.fill") }
                .tag(Tabs.news)
        }
        .navigationTitle(selectedTab.rawValue)
        .navigationBarBackButtonHidden(true)
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadView()
//    }
//}
