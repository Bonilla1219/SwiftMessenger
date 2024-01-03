//
//  User.swift
//  SwiftMessenger
//
//  Created by Javier Bonilla on 12/13/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable{
    let id = NSUUID().uuidString
    let fullname:String
    let email:String
    let profileImageUrl: String?
    
}

extension User{
    static let MOCK_USER = User(fullname: "Bruce Wayne", email: "Batman@gmail.com", profileImageUrl: "batman")
}
