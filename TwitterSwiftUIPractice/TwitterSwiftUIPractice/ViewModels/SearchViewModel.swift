//
//  SearchViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/11.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    init(){
        fetchUsers()
    }
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({
                User(dictionary: $0.data())
            })
            // same as the above code
//            documents.forEach { (document) in
//                let user = User(dictionary: document.data())
//                self.users.append(user)
//            }
        }
    }
}
