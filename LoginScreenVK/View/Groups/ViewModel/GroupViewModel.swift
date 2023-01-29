//
//  GroupViewModel.swift
//  LoginScreenVK
//
//  Created by Алексей on 15.01.2023.
//

import Foundation
import Combine

class GroupViewModel: ObservableObject {
    let apiService: APIService
    @Published var groups: [Group] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getGroups() {
        apiService.getGroups { groups in
            self.groups = groups
        }
    }
}
