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
    
    init(user: User){
        self.user = user
        self.viewModel   = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}
