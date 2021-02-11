//
//  ConverstaionsViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/13.
//

import SwiftUI

class ConversationsViewModel: ObservableObject{
    @Published var recentMessages = [Message]()
    private var recentMessageDictionary = [String: Message]()
    
    init(){
        fetchRecentMessages()
    }
    func fetchRecentMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        query.addSnapshotListener { (snapshot, error) in
            guard let changes = snapshot?.documentChanges else { return }
            changes.forEach { (change) in
                let data = change.document.data()
                let uid = change.document.documentID
                
                COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
                    guard let messageData = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    
                    self.recentMessageDictionary[uid] = Message(user: user, dictionary: messageData)
                    
                    self.recentMessages = Array(self.recentMessageDictionary.values)
                }
            }
        }
    }
}