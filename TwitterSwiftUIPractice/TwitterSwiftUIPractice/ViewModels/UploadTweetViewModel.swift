//
//  UploadTweetViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/12.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject{
    
    
    func uploadTweet(caption: String){
        guard let uid = AuthViewModel.shared.userSession?.uid else  { return }
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = [
            "uid": user.id,
            "caption": caption,
            "fullname": user.fullname,
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "likes": 0,
            "id": docRef.documentID
        ]
        
        docRef.setData(data) { (error) in
            print("DEBUG: Upload success")
        }
    }
}
