//
//  UserProfileView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/07.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(user: user)
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}
