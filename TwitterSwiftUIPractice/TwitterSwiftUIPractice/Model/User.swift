//
//  User.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/11.
//

import Foundation

struct User: Identifiable{
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    
    init(dictionary: [String: Any]){
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileimageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
