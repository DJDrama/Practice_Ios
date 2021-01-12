//
//  SwiftUIView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/12.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
    func likeTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_TWEETS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes+1])
        
        tweetLikesRef.document(uid)
            .setData([ : ]) { _ in
                userLikesRef.document(self.tweet.id).setData([:]){_ in
                    self.didLike = true
                }
            }
    }
    func unlikeTweet(){
        
    }
}

