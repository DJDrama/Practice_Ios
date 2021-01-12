//
//  UserProfileView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/07.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    init(user: User){
        self.user = user
        self.viewModel   = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) {item in
                    TweetCell(tweet: item)
                        .padding()
                }
            }
            .navigationTitle(user.username)
        }
    }
}
