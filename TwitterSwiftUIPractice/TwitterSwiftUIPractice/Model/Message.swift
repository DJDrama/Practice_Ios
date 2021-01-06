//
//  Message.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import Foundation

struct MockMessage: Identifiable{
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hey! whats'up!", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "spiderman", messageText: "Well tomorrow!", isCurrentUser: false),
    .init(id: 3, imageName: "batman", messageText: "What?", isCurrentUser: true),
    .init(id: 4, imageName: "spiderman", messageText: "Interview tomorrow. didn't prepare at all!", isCurrentUser: false),
    .init(id: 5, imageName: "spiderman", messageText: "How about you?", isCurrentUser: false),
    .init(id: 6, imageName: "batman", messageText: "Well i didn't apply...", isCurrentUser: true)
]
