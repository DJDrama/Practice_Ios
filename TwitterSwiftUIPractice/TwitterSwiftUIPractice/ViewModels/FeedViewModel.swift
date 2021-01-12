//
//  FeedViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/12.
//

import SwiftUI

class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    func fetchTweets(){
        COLLECTION_TWEETS.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {return}
            
            self.tweets = documents.map({
                Tweet(dictionary: $0.data())
            })
        }
    }
}
