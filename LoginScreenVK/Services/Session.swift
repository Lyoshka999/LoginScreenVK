//
//  Session.swift
//  LoginScreenVK
//
//  Created by Алексей on 15.01.2023.
//

import Foundation

final class Session {
    static let shared = Session()
    
    private init() {}
    
    var token: String = ""
    var userId: String = ""
}
