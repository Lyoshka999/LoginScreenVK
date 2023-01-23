//
//  LikeViewModel.swift
//  LoginScreenVK
//
//  Created by Алексей on 23.01.2023.
//

import Foundation

class LikeViewModel: ObservableObject {
    @Published var countLikes: Int
    @Published var isLikes: Bool
    
    init(countLikes: Int, isLikes: Bool = false) {
        self.countLikes = countLikes
        self.isLikes = isLikes
    }
    
    func toggleLike() {
        let count = isLikes ? -1 : 1
        countLikes += count
        isLikes.toggle()
    }
}
