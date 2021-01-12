//
//  ProfileViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/11.
//
import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject{
    let user: User
    @Published var isFollowed = false
    
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User){
        self.user=user
        checkIfUserisFollowed()
        fetchUserTweets()
        fetchLikedTweets()
    }
    
    func follow(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followerRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).setData([:]){_ in
            followerRef.document(currentUid).setData([:]){_ in
                self.isFollowed=true
            }
        }
    }
    
    func unFollow(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followerRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete{ _ in
            followerRef.document(currentUid).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
    func checkIfUserisFollowed(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        followingRef.document(user.id).getDocument { (snapshot, error) in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
    
    func fetchUserTweets(){
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            self.userTweets = documents.map(
                {
                    Tweet(dictionary: $0.data())
                })
            
        }
    }
    
    func fetchLikedTweets(){
        var tweets = [Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            let tweetIds = documents.map({
                $0.documentID
            })
            tweetIds.forEach{ id in
                COLLECTION_TWEETS.document(id).getDocument { (snapshot, error) in
                    guard let data = snapshot?.data() else { return }
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    
                    guard tweets.count == tweetIds.count else { return }
                    self.likedTweets = tweets
                }
            }
        }
    }
    
    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet]{
        switch filter {
        case .tweets : return userTweets
        case .likes : return likedTweets
        }
    }
}
