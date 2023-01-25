//
//  Coordinator.swift
//  LoginScreenVK
//
//  Created by Алексей on 25.01.2023.
//

import Foundation
import SwiftUI

class HeadCoordinator: UITabBarController {
    var friendViewModel: FriendViewModel
    var groupsViewModel: GroupViewModel
    
    init() {
        let apiService = APIService()
        self.friendViewModel = FriendViewModel(apiService: apiService)
        self.groupsViewModel = GroupViewModel(apiService: apiService)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let friendView = FriendsListView(viewModel: self.friendViewModel)
        let vcFriend = UIHostingController(rootView: friendView)
        let friendTabBarItem = UITabBarItem(title: "Друзья", image: UIImage(systemName: "person.2.fill"), tag: 0)
        vcFriend.tabBarItem = friendTabBarItem
        
        let groupView = GroupsListView(viewModel: self.groupsViewModel)
        let vcGroup = UIHostingController(rootView: groupView)
        let groupTabBarItem = UITabBarItem(title: "Группы", image: UIImage(systemName: "person.3.fill"), tag: 1)
        vcGroup.tabBarItem = groupTabBarItem
        
        let vcNews = UIHostingController(rootView: NewsListView())
        let newsTabBarItem = UITabBarItem(title: "Новости", image: UIImage(systemName: "newspaper.fill"), tag: 2)
        vcNews.tabBarItem = newsTabBarItem
        
        let controllers = [vcFriend, vcGroup, vcNews]
        self.viewControllers = controllers
        self.navigationItem.title = "navigation"
    }
}
